package com.Grownited.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.Grownited.entity.HackathonEntity;
import com.Grownited.entity.HackathonDescriptionEntity;
import com.Grownited.entity.HackathonJudgeEntity;
import com.Grownited.entity.HackathonPrizeEntity;
import com.Grownited.entity.HackathonResultEntity;
import com.Grownited.entity.HackathonSubmissionEntity;
import com.Grownited.entity.HackathonTeamEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.HackathonDescriptionRepository;
import com.Grownited.repository.HackathonJudgeRepository;
import com.Grownited.repository.HackathonPrizeRepository;
import com.Grownited.repository.HackathonResultRepository;
import com.Grownited.repository.HackathonRepository;
import com.Grownited.repository.HackathonSubmissionRepository;
import com.Grownited.repository.HackathonTeamRepository;
import com.Grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class JudgeController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	HackathonRepository hackathonRepository;

	@Autowired
	HackathonDescriptionRepository hackathonDescriptionRepository;

	@Autowired
	HackathonPrizeRepository hackathonPrizeRepository;

	@Autowired
	HackathonJudgeRepository hackathonJudgeRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	Cloudinary cloudinary;

	@Autowired
	HackathonSubmissionRepository hackathonSubmissionRepository;

	@Autowired
	HackathonResultRepository hackathonResultRepository;

	@Autowired
	HackathonTeamRepository hackathonTeamRepository;

	@GetMapping("judge-dashboard")
	public String judgeDashboard(Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}
		if (Boolean.TRUE.equals(user.getPasswordResetRequired())) {
			return "redirect:/judge/change-password";
		}

		List<HackathonJudgeEntity> judgeAssignments = hackathonJudgeRepository.findByUserId(user.getUserId());
		List<Integer> assignedHackathonIds = judgeAssignments.stream().map(HackathonJudgeEntity::getHackathonId)
				.collect(Collectors.toList());
		List<HackathonEntity> ongoingHackathonList = new java.util.ArrayList<>();
		long totalHackathon = 0;
		long upcomingHackathon = 0;
		long ongoingHackathon = 0;
		for (HackathonJudgeEntity assign : judgeAssignments) {
			HackathonEntity h = hackathonRepository.findById(assign.getHackathonId()).orElse(null);
			if (h != null) {
				totalHackathon++;
				if ("UPCOMING".equalsIgnoreCase(h.getStatus())) {
					upcomingHackathon++;
				} else if ("ONGOING".equalsIgnoreCase(h.getStatus())) {
					ongoingHackathon++;
					ongoingHackathonList.add(h);
				}
			}
		}

		List<HackathonSubmissionEntity> pendingSubmissionList = new ArrayList<>();
		List<HackathonSubmissionEntity> reviewedSubmissionList = new ArrayList<>();
		Map<Integer, HackathonEntity> submissionHackathonMap = new HashMap<>();
		Map<Integer, HackathonTeamEntity> submissionTeamMap = new HashMap<>();

		if (!assignedHackathonIds.isEmpty()) {
			List<HackathonSubmissionEntity> submissions = hackathonSubmissionRepository.findByHackathonIdIn(assignedHackathonIds);
			submissions.sort((a, b) -> {
				if (a.getSubmitedDate() == null && b.getSubmitedDate() == null) {
					return 0;
				}
				if (a.getSubmitedDate() == null) {
					return 1;
				}
				if (b.getSubmitedDate() == null) {
					return -1;
				}
				return b.getSubmitedDate().compareTo(a.getSubmitedDate());
			});

			for (HackathonSubmissionEntity submission : submissions) {
				hackathonRepository.findById(submission.getHackathonId())
						.ifPresent(h -> submissionHackathonMap.putIfAbsent(h.getHackathonId(), h));
				hackathonTeamRepository.findById(submission.getTeamId())
						.ifPresent(t -> submissionTeamMap.putIfAbsent(t.getHackathonTeamId(), t));

				boolean reviewed = hackathonResultRepository.findByHackathonIdAndJudgeIdAndTeamId(submission.getHackathonId(),
						user.getUserId(), submission.getTeamId()).isPresent();
				if (reviewed) {
					reviewedSubmissionList.add(submission);
				} else {
					pendingSubmissionList.add(submission);
				}
			}
		}

		long pendingReviewSubmission = pendingSubmissionList.size();

		model.addAttribute("totalHackathon", totalHackathon);
		model.addAttribute("upcomingHackathon", upcomingHackathon);
		model.addAttribute("ongoingHackathon", ongoingHackathon);
		model.addAttribute("pendingReviewSubmission", pendingReviewSubmission);
		model.addAttribute("ongoingHackathonList", ongoingHackathonList);
		model.addAttribute("pendingSubmissionList", pendingSubmissionList);
		model.addAttribute("reviewedSubmissionList", reviewedSubmissionList);
		model.addAttribute("submissionHackathonMap", submissionHackathonMap);
		model.addAttribute("submissionTeamMap", submissionTeamMap);
		return "judge/JudgeDashboard";
	}

	@GetMapping("judge/viewHackathon")
	public String judgeViewHackathon(@RequestParam Integer hackathonId, Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}
		if (Boolean.TRUE.equals(user.getPasswordResetRequired())) {
			return "redirect:/judge/change-password";
		}

		boolean assigned = hackathonJudgeRepository.existsByHackathonIdAndUserId(hackathonId, user.getUserId());
		if (!assigned) {
			return "redirect:/judge-dashboard";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/judge-dashboard";
		}

		Optional<HackathonDescriptionEntity> description = hackathonDescriptionRepository.findFirstByHackathonId(hackathonId);
		List<HackathonPrizeEntity> prizeList = hackathonPrizeRepository.findByHackathonIdOrderByHackathonPrizeIdAsc(hackathonId);
		List<HackathonJudgeEntity> judgeAssignments = hackathonJudgeRepository.findByHackathonId(hackathonId);
		List<Integer> judgeIds = judgeAssignments.stream().map(HackathonJudgeEntity::getUserId).collect(Collectors.toList());
		List<UserEntity> judgeUsers = judgeIds.isEmpty() ? new ArrayList<>() : userRepository.findAllById(judgeIds);

		List<HackathonSubmissionEntity> allSubmissions = hackathonSubmissionRepository.findByHackathonIdIn(List.of(hackathonId));
		allSubmissions.sort((a, b) -> {
			if (a.getSubmitedDate() == null && b.getSubmitedDate() == null) {
				return 0;
			}
			if (a.getSubmitedDate() == null) {
				return 1;
			}
			if (b.getSubmitedDate() == null) {
				return -1;
			}
			return b.getSubmitedDate().compareTo(a.getSubmitedDate());
		});

		List<HackathonSubmissionEntity> pendingSubmissionList = new ArrayList<>();
		List<HackathonSubmissionEntity> reviewedSubmissionList = new ArrayList<>();
		Map<Integer, HackathonTeamEntity> submissionTeamMap = new HashMap<>();

		for (HackathonSubmissionEntity submission : allSubmissions) {
			hackathonTeamRepository.findById(submission.getTeamId())
					.ifPresent(t -> submissionTeamMap.putIfAbsent(t.getHackathonTeamId(), t));

			boolean reviewed = hackathonResultRepository.findByHackathonIdAndJudgeIdAndTeamId(hackathonId, user.getUserId(),
					submission.getTeamId()).isPresent();
			if (reviewed) {
				reviewedSubmissionList.add(submission);
			} else {
				pendingSubmissionList.add(submission);
			}
		}

		model.addAttribute("hackathon", opHackathon.get());
		model.addAttribute("hackathonDescription", description.orElse(null));
		model.addAttribute("prizeList", prizeList);
		model.addAttribute("judgeUsers", judgeUsers);
		model.addAttribute("pendingSubmissionList", pendingSubmissionList);
		model.addAttribute("reviewedSubmissionList", reviewedSubmissionList);
		model.addAttribute("submissionTeamMap", submissionTeamMap);
		return "judge/JudgeHackathonView";
	}

	@GetMapping("judge/change-password")
	public String judgeChangePassword(HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}
		return "judge/JudgeChangePassword";
	}

	@PostMapping("judge/update-password")
	public String judgeUpdatePassword(String newPassword, String confirmPassword, Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}

		if (newPassword == null || newPassword.length() < 6) {
			model.addAttribute("error", "Password must be at least 6 characters.");
			return "judge/JudgeChangePassword";
		}
		if (!newPassword.equals(confirmPassword)) {
			model.addAttribute("error", "New password and confirm password do not match.");
			return "judge/JudgeChangePassword";
		}

		user.setPassword(passwordEncoder.encode(newPassword));
		user.setPasswordResetRequired(false);
		userRepository.save(user);
		session.setAttribute("user", user);
		return "redirect:/judge-dashboard";
	}

	@GetMapping("judge/profile")
	public String judgeProfile(HttpSession session, Model model) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}
		model.addAttribute("judge", user);
		return "judge/JudgeProfile";
	}

	@PostMapping("judge/profile/update")
	public String updateJudgeProfile(UserEntity formUser, MultipartFile profilePic, HttpSession session, Model model) {
		UserEntity sessionUser = (UserEntity) session.getAttribute("user");
		if (sessionUser == null || !"JUDGE".equals(sessionUser.getRole())) {
			return "redirect:/login";
		}

		UserEntity dbUser = userRepository.findById(sessionUser.getUserId()).orElse(sessionUser);
		dbUser.setFirstName(formUser.getFirstName());
		dbUser.setLastName(formUser.getLastName());
		dbUser.setContactNum(formUser.getContactNum());
		dbUser.setQualification(formUser.getQualification());
		dbUser.setDesignation(formUser.getDesignation());
		dbUser.setOrganization(formUser.getOrganization());

		if (profilePic != null && !profilePic.isEmpty()) {
			try {
				Map upload = cloudinary.uploader().upload(profilePic.getBytes(), null);
				Object secureUrl = upload.get("secure_url");
				if (secureUrl != null) {
					dbUser.setProfilePicURL(secureUrl.toString());
				}
			} catch (IOException e) {
				model.addAttribute("error", "Profile image upload failed. Please try again.");
				model.addAttribute("judge", dbUser);
				return "judge/JudgeProfile";
			}
		}

		userRepository.save(dbUser);
		session.setAttribute("user", dbUser);
		return "redirect:/judge/profile?updated=true";
	}

	@GetMapping("judge/submissions")
	public String judgeSubmissions(Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}
		if (Boolean.TRUE.equals(user.getPasswordResetRequired())) {
			return "redirect:/judge/change-password";
		}

		List<Integer> assignedHackathonIds = hackathonJudgeRepository.findByUserId(user.getUserId()).stream()
				.map(HackathonJudgeEntity::getHackathonId).collect(Collectors.toList());

		List<HackathonSubmissionEntity> submissions = assignedHackathonIds.isEmpty() ? new ArrayList<>()
				: hackathonSubmissionRepository.findByHackathonIdIn(assignedHackathonIds);

		Map<Integer, HackathonEntity> hackathonMap = new HashMap<>();
		Map<Integer, HackathonTeamEntity> teamMap = new HashMap<>();
		Map<Integer, Boolean> reviewedMap = new HashMap<>();

		for (HackathonSubmissionEntity submission : submissions) {
			hackathonRepository.findById(submission.getHackathonId()).ifPresent(h -> hackathonMap.put(h.getHackathonId(), h));
			hackathonTeamRepository.findById(submission.getTeamId()).ifPresent(t -> teamMap.put(t.getHackathonTeamId(), t));
			boolean reviewed = hackathonResultRepository
					.findByHackathonIdAndJudgeIdAndTeamId(submission.getHackathonId(), user.getUserId(), submission.getTeamId())
					.isPresent();
			reviewedMap.put(submission.getHackathonSubmissionId(), reviewed);
		}

		model.addAttribute("submissions", submissions);
		model.addAttribute("hackathonMap", hackathonMap);
		model.addAttribute("teamMap", teamMap);
		model.addAttribute("reviewedMap", reviewedMap);
		return "judge/JudgeSubmissions";
	}

	@GetMapping("judge/submissions/review")
	public String reviewSubmission(@RequestParam Integer submissionId, Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}
		if (Boolean.TRUE.equals(user.getPasswordResetRequired())) {
			return "redirect:/judge/change-password";
		}

		Optional<HackathonSubmissionEntity> opSubmission = hackathonSubmissionRepository.findById(submissionId);
		if (opSubmission.isEmpty()) {
			return "redirect:/judge/submissions";
		}
		HackathonSubmissionEntity submission = opSubmission.get();

		boolean assigned = hackathonJudgeRepository.existsByHackathonIdAndUserId(submission.getHackathonId(), user.getUserId());
		if (!assigned) {
			return "redirect:/judge/submissions";
		}

		HackathonResultEntity result = hackathonResultRepository
				.findByHackathonIdAndJudgeIdAndTeamId(submission.getHackathonId(), user.getUserId(), submission.getTeamId())
				.orElse(new HackathonResultEntity());

		model.addAttribute("submission", submission);
		model.addAttribute("hackathon", hackathonRepository.findById(submission.getHackathonId()).orElse(null));
		model.addAttribute("team", hackathonTeamRepository.findById(submission.getTeamId()).orElse(null));
		model.addAttribute("result", result);
		return "judge/ReviewSubmission";
	}

	@PostMapping("judge/submissions/review/save")
	public String saveReview(HackathonResultEntity formResult, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null || !"JUDGE".equals(user.getRole())) {
			return "redirect:/login";
		}
		if (Boolean.TRUE.equals(user.getPasswordResetRequired())) {
			return "redirect:/judge/change-password";
		}
		if (formResult.getHackathonId() == null || formResult.getTeamId() == null) {
			return "redirect:/judge/submissions";
		}

		boolean assigned = hackathonJudgeRepository.existsByHackathonIdAndUserId(formResult.getHackathonId(), user.getUserId());
		if (!assigned) {
			return "redirect:/judge/submissions";
		}

		HackathonResultEntity dbResult = hackathonResultRepository
				.findByHackathonIdAndJudgeIdAndTeamId(formResult.getHackathonId(), user.getUserId(), formResult.getTeamId())
				.orElse(new HackathonResultEntity());

		dbResult.setHackathonId(formResult.getHackathonId());
		dbResult.setJudgeId(user.getUserId());
		dbResult.setTeamId(formResult.getTeamId());
		dbResult.setInnovation(formResult.getInnovation());
		dbResult.setImplementation(formResult.getImplementation());
		dbResult.setCodingStandard(formResult.getCodingStandard());
		dbResult.setRound(formResult.getRound());
		hackathonResultRepository.save(dbResult);

		return "redirect:/judge/submissions?saved=true";
	}
}
