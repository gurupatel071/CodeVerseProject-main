package com.Grownited.controller.participant;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.transaction.annotation.Transactional;

import com.Grownited.entity.HackathonDescriptionEntity;
import com.Grownited.entity.HackathonEntity;
import com.Grownited.entity.HackathonParticipantEntity;
import com.Grownited.entity.HackathonPrizeEntity;
import com.Grownited.entity.HackathonResultEntity;
import com.Grownited.entity.HackathonTeamEntity;
import com.Grownited.entity.HackathonTeamInviteEntity;
import com.Grownited.entity.HackathonTeamMemberEntity;
import com.Grownited.entity.LeaderboardRow;
import com.Grownited.entity.MyHackathonRow;
import com.Grownited.entity.HackathonSubmissionEntity;
import com.Grownited.entity.UserDetailEntity;
import com.Grownited.entity.UserEntity;

import com.Grownited.repository.HackathonDescriptionRepository;
import com.Grownited.repository.HackathonPrizeRepository;
import com.Grownited.repository.HackathonRepository;
import com.Grownited.repository.HackathonParticipantRepository;
import com.Grownited.repository.HackathonResultRepository;
import com.Grownited.repository.HackathonTeamInviteRepository;
import com.Grownited.repository.HackathonTeamMemberRepository;
import com.Grownited.repository.HackathonTeamRepository;
import com.Grownited.repository.HackathonSubmissionRepository;
import com.Grownited.repository.UserDetailRepository;
import com.Grownited.repository.UserRepository;
import com.Grownited.service.MailerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ParticipantController {

	@Autowired
	HackathonRepository hackathonRepository;

	@Autowired
	HackathonDescriptionRepository hackathonDescriptionRepository;

	@Autowired
	HackathonPrizeRepository hackathonPrizeRepository;

	@Autowired
	HackathonTeamRepository hackathonTeamRepository;

	@Autowired
	HackathonTeamMemberRepository hackathonTeamMemberRepository;

	@Autowired
	HackathonTeamInviteRepository hackathonTeamInviteRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	HackathonSubmissionRepository hackathonSubmissionRepository;

	@Autowired
	HackathonResultRepository hackathonResultRepository;

	@Autowired
	HackathonParticipantRepository hackathonParticipantRepository;

	@Autowired
	UserDetailRepository userDetailRepository;

	@Autowired
	MailerService mailerService;

	@GetMapping("/participant/participant-dashboard")
	public String participantDashboard() {
		return "participant/ParticipantDashboard";
	}

	@GetMapping("/participant/home")
	public String home(Model model) {
		model.addAttribute("hackathons", hackathonRepository.findAll());
		return "participant/Home";
	}

	@GetMapping("participant/profile")
	public String profile(@RequestParam(required = false) String success, @RequestParam(required = false) String error,
			Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		UserDetailEntity userDetail = userDetailRepository.findByUserId(user.getUserId())
				.orElse(new UserDetailEntity());
		model.addAttribute("user", user);
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("success", success);
		model.addAttribute("error", error);
		return "participant/ParticipantProfile";
	}

	@PostMapping("participant/profile/save")
	@Transactional
	public String saveProfile(@RequestParam String firstName, @RequestParam String lastName,
			@RequestParam(required = false) String contactNum, @RequestParam(required = false) String gender,
			@RequestParam(required = false) Integer birthYear, @RequestParam(required = false) String qualification,
			@RequestParam(required = false) String designation, @RequestParam(required = false) String organization,
			@RequestParam(required = false) String city, @RequestParam(required = false) String state,
			@RequestParam(required = false) String country, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		if (!StringUtils.hasText(firstName) || !StringUtils.hasText(lastName)) {
			return "redirect:/participant/profile?error=invalidName";
		}

		user.setFirstName(firstName.trim());
		user.setLastName(lastName.trim());
		user.setContactNum(StringUtils.hasText(contactNum) ? contactNum.trim() : null);
		user.setGender(StringUtils.hasText(gender) ? gender.trim() : null);
		user.setBirthYear(birthYear);
		user.setQualification(StringUtils.hasText(qualification) ? qualification.trim() : null);
		user.setDesignation(StringUtils.hasText(designation) ? designation.trim() : null);
		user.setOrganization(StringUtils.hasText(organization) ? organization.trim() : null);
		userRepository.save(user);

		UserDetailEntity userDetail = userDetailRepository.findByUserId(user.getUserId())
				.orElse(new UserDetailEntity());
		userDetail.setUserId(user.getUserId());
		userDetail.setQualification(StringUtils.hasText(qualification) ? qualification.trim() : null);
		userDetail.setCity(StringUtils.hasText(city) ? city.trim() : null);
		userDetail.setState(StringUtils.hasText(state) ? state.trim() : null);
		userDetail.setCountry(StringUtils.hasText(country) ? country.trim() : null);
		userDetailRepository.save(userDetail);

		session.setAttribute("user", user);
		return "redirect:/participant/profile?success=updated";
	}

	@GetMapping("participant/my-hackathons")
	public String myHackathons(Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		LocalDate today = LocalDate.now();

		Map<Integer, MyHackathonRow> rowMap = new LinkedHashMap<>();

		List<HackathonParticipantEntity> joinedHackathons = hackathonParticipantRepository
				.findByParticipantId(user.getUserId());
		for (HackathonParticipantEntity joined : joinedHackathons) {
			Optional<HackathonEntity> opHackathon = hackathonRepository.findById(joined.getHackathonId());
			if (opHackathon.isPresent()) {
				MyHackathonRow row = new MyHackathonRow();
				row.setHackathon(opHackathon.get());
				row.setTeamId(null);
				row.setTeamName("Not Joined Any Team");
				row.setLeader(false);
				row.setRoleTitle("PARTICIPANT");
				row.setTeamSize(0);
				row.setPendingInvites(0);
				row.setSubmissionEnabled(isSubmissionOpen(opHackathon.get(), today));
				rowMap.put(opHackathon.get().getHackathonId(), row);
			}
		}

		List<HackathonTeamEntity> leaderTeams = hackathonTeamRepository.findByTeamLeaderId(user.getUserId());
		for (HackathonTeamEntity team : leaderTeams) {
			Optional<HackathonEntity> opHackathon = hackathonRepository.findById(team.getHackathonId());
			if (opHackathon.isPresent()) {
				HackathonEntity h = opHackathon.get();
				MyHackathonRow row = new MyHackathonRow();
				row.setHackathon(h);
				row.setTeamId(team.getHackathonTeamId());
				row.setTeamName(team.getTeamName());
				row.setLeader(true);
				row.setRoleTitle("TEAM_LEADER");
				row.setTeamSize((int) hackathonTeamMemberRepository.countByTeamId(team.getHackathonTeamId()));
				row.setPendingInvites((int) hackathonTeamInviteRepository
						.countByTeamIdAndInviteStatus(team.getHackathonTeamId(), "PENDING"));
				row.setSubmissionEnabled(isSubmissionOpen(h, today));
				rowMap.put(h.getHackathonId(), row);
			}
		}

		List<HackathonTeamMemberEntity> memberships = hackathonTeamMemberRepository.findByMemberId(user.getUserId());
		for (HackathonTeamMemberEntity member : memberships) {
			if (rowMap.containsKey(member.getHackathonId())) {
				continue;
			}
			Optional<HackathonEntity> opHackathon = hackathonRepository.findById(member.getHackathonId());
			Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(member.getTeamId());
			if (opHackathon.isPresent() && opTeam.isPresent()) {
				MyHackathonRow row = new MyHackathonRow();
				row.setHackathon(opHackathon.get());
				row.setTeamId(opTeam.get().getHackathonTeamId());
				row.setTeamName(opTeam.get().getTeamName());
				row.setLeader(user.getUserId().equals(opTeam.get().getTeamLeaderId()));
				row.setRoleTitle(member.getRoleTitle());
				row.setTeamSize((int) hackathonTeamMemberRepository.countByTeamId(opTeam.get().getHackathonTeamId()));
				row.setPendingInvites((int) hackathonTeamInviteRepository
						.countByTeamIdAndInviteStatus(opTeam.get().getHackathonTeamId(), "PENDING"));
				row.setSubmissionEnabled(isSubmissionOpen(opHackathon.get(), today));
				rowMap.put(opHackathon.get().getHackathonId(), row);
			}
		}

		model.addAttribute("myHackathons", rowMap.values());
		model.addAttribute("totalCount", rowMap.size());
		return "participant/MyHackathons";
	}

	@GetMapping("participant/hackathon/{hackathonId}")
	public String hackathonDetails(@PathVariable Integer hackathonId, @RequestParam(required = false) String joined,
			@RequestParam(required = false) String success, @RequestParam(required = false) String error, Model model,
			HttpSession session) {
		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}

		HackathonEntity hackathon = opHackathon.get();
		Optional<HackathonDescriptionEntity> description = hackathonDescriptionRepository
				.findFirstByHackathonId(hackathonId);
		List<HackathonPrizeEntity> prizes = hackathonPrizeRepository
				.findByHackathonIdOrderByHackathonPrizeIdAsc(hackathonId);
		UserEntity user = (UserEntity) session.getAttribute("user");

		LocalDate today = LocalDate.now();
		boolean registrationOpen = hackathon.getRegistrationStartDate() != null
				&& hackathon.getRegistrationEndDate() != null && !today.isBefore(hackathon.getRegistrationStartDate())
				&& !today.isAfter(hackathon.getRegistrationEndDate());

		boolean alreadyRegistered = false;
		boolean alreadyInTeam = false;
		Integer teamId = null;
		HackathonTeamInviteEntity pendingInvite = null;
		if (user != null) {
			alreadyRegistered = hackathonParticipantRepository.existsByHackathonIdAndParticipantId(hackathonId,
					user.getUserId());
			alreadyInTeam = hackathonTeamRepository.existsByHackathonIdAndTeamLeaderId(hackathonId, user.getUserId())
					|| hackathonTeamMemberRepository.existsByHackathonIdAndMemberId(hackathonId, user.getUserId());
			teamId = findTeamIdForUser(hackathonId, user.getUserId());
			pendingInvite = hackathonTeamInviteRepository
					.findFirstByHackathonIdAndInvitedUserIdAndInviteStatus(hackathonId, user.getUserId(), "PENDING")
					.orElse(null);
		}

		model.addAttribute("hackathon", hackathon);
		model.addAttribute("hackathonDescription", description.orElse(null));
		model.addAttribute("prizeList", prizes);
		model.addAttribute("registrationOpen", registrationOpen);
		model.addAttribute("alreadyRegistered", alreadyRegistered);
		model.addAttribute("alreadyInTeam", alreadyInTeam);
		model.addAttribute("canJoin", user != null && registrationOpen && !alreadyRegistered);
		model.addAttribute("pendingInvite", pendingInvite);
		model.addAttribute("teamId", teamId);
		model.addAttribute("teamCount", hackathonTeamRepository.countByHackathonId(hackathonId));
		model.addAttribute("joined", joined);
		model.addAttribute("success", success);
		model.addAttribute("error", error);
		boolean completed = "COMPLETE".equalsIgnoreCase(hackathon.getStatus())
				|| "COMPLETED".equalsIgnoreCase(hackathon.getStatus());
		model.addAttribute("leaderboardAvailable",
				completed && Boolean.TRUE.equals(hackathon.getLeaderboardPublished()));
		return "participant/HackathonDetail";
	}

	@GetMapping("participant/hackathon/{hackathonId}/leaderboard")
	public String leaderboard(@PathVariable Integer hackathonId, Model model) {
		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}

		HackathonEntity hackathon = opHackathon.get();
		boolean completed = "COMPLETE".equalsIgnoreCase(hackathon.getStatus())
				|| "COMPLETED".equalsIgnoreCase(hackathon.getStatus());
		boolean published = Boolean.TRUE.equals(hackathon.getLeaderboardPublished());
		if (!completed || !published) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=leaderboardNotReady";
		}

		List<HackathonTeamEntity> teams = hackathonTeamRepository.findByHackathonId(hackathonId);
		List<HackathonResultEntity> results = hackathonResultRepository.findByHackathonId(hackathonId);

		Map<Integer, LeaderboardRow> rowMap = new HashMap<>();
		for (HackathonTeamEntity team : teams) {
			LeaderboardRow row = new LeaderboardRow();
			row.setTeamId(team.getHackathonTeamId());
			row.setTeamName(team.getTeamName());
			rowMap.put(team.getHackathonTeamId(), row);
		}

		for (HackathonResultEntity result : results) {
			LeaderboardRow row = rowMap.get(result.getTeamId());
			if (row == null) {
				continue;
			}
			int innovation = result.getInnovation() == null ? 0 : result.getInnovation();
			int implementation = result.getImplementation() == null ? 0 : result.getImplementation();
			int codingStandard = result.getCodingStandard() == null ? 0 : result.getCodingStandard();
			int total = innovation + implementation + codingStandard;
			row.setTotalScore(row.getTotalScore() + total);
			row.setEvaluationCount(row.getEvaluationCount() + 1);
		}

		List<LeaderboardRow> leaderboardRows = new ArrayList<>(rowMap.values());
		for (LeaderboardRow row : leaderboardRows) {
			if (row.getEvaluationCount() > 0) {
				row.setAverageScore((double) row.getTotalScore() / row.getEvaluationCount());
			}
		}

		leaderboardRows.sort(Comparator.comparingDouble(LeaderboardRow::getAverageScore).reversed()
				.thenComparing(Comparator.comparingInt(LeaderboardRow::getTotalScore).reversed())
				.thenComparing(LeaderboardRow::getTeamName, String.CASE_INSENSITIVE_ORDER));

		int rank = 0;
		double prevAvg = -1d;
		int prevTotal = -1;
		int tieRank = 0;
		for (LeaderboardRow row : leaderboardRows) {
			tieRank++;
			if (Double.compare(row.getAverageScore(), prevAvg) != 0 || row.getTotalScore() != prevTotal) {
				rank = tieRank;
				prevAvg = row.getAverageScore();
				prevTotal = row.getTotalScore();
			}
			row.setRank(rank);
		}

		model.addAttribute("hackathon", hackathon);
		model.addAttribute("leaderboardRows", leaderboardRows);
		model.addAttribute("totalTeams", teams.size());
		model.addAttribute("totalEvaluations", results.size());
		return "participant/Leaderboard";
	}

	@PostMapping("participant/hackathon/{hackathonId}/join")
	@Transactional
	public String joinHackathon(@PathVariable Integer hackathonId, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}

		HackathonEntity hackathon = opHackathon.get();
		LocalDate today = LocalDate.now();
		boolean registrationOpen = hackathon.getRegistrationStartDate() != null
				&& hackathon.getRegistrationEndDate() != null && !today.isBefore(hackathon.getRegistrationStartDate())
				&& !today.isAfter(hackathon.getRegistrationEndDate());
		if (!registrationOpen) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=registrationClosed";
		}

		boolean alreadyRegistered = hackathonParticipantRepository.existsByHackathonIdAndParticipantId(hackathonId,
				user.getUserId());
		if (alreadyRegistered) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=alreadyRegistered";
		}

		HackathonParticipantEntity participant = new HackathonParticipantEntity();
		participant.setHackathonId(hackathonId);
		participant.setParticipantId(user.getUserId());
		participant.setJoinedDate(LocalDate.now());
		hackathonParticipantRepository.save(participant);

		return "redirect:/participant/hackathon/" + hackathonId + "?joined=true";
	}

	@GetMapping("participant/hackathon/{hackathonId}/team")
	public String manageTeam(@PathVariable Integer hackathonId, @RequestParam(required = false) String success,
			@RequestParam(required = false) String error, Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}

		Integer teamId = findTeamIdForUser(hackathonId, user.getUserId());
		boolean joinedHackathon = hackathonParticipantRepository.existsByHackathonIdAndParticipantId(hackathonId,
				user.getUserId());
		if (!joinedHackathon) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}
		boolean hasTeam = teamId != null;
		boolean isTeamLeader = false;
		HackathonTeamEntity team = null;
		HackathonTeamInviteEntity pendingInvite = null;
		HackathonTeamEntity pendingInviteTeam = null;
		List<HackathonTeamMemberEntity> teamMembers = new ArrayList<>();
		Map<Integer, UserEntity> memberMap = new HashMap<>();
		List<UserEntity> participantUsers = new ArrayList<>();
		List<HackathonTeamInviteEntity> inviteList = new ArrayList<>();

		if (hasTeam) {
			Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(teamId);
			if (opTeam.isEmpty()) {
				return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
			}
			team = opTeam.get();
			isTeamLeader = user.getUserId().equals(team.getTeamLeaderId());

			teamMembers = hackathonTeamMemberRepository.findByTeamIdOrderByHackathonTeamMemberIdAsc(teamId);
			for (HackathonTeamMemberEntity member : teamMembers) {
				Optional<UserEntity> opMember = userRepository.findById(member.getMemberId());
				opMember.ifPresent(userEntity -> memberMap.put(member.getMemberId(), userEntity));
			}

			List<Integer> existingMemberIds = teamMembers.stream().map(HackathonTeamMemberEntity::getMemberId)
					.collect(Collectors.toList());
			List<Integer> joinedParticipantIds = hackathonParticipantRepository.findByHackathonId(hackathonId).stream()
					.map(HackathonParticipantEntity::getParticipantId).collect(Collectors.toList());
			participantUsers = userRepository.findAllById(joinedParticipantIds).stream()
					.filter(u -> "PARTICIPANT".equals(u.getRole())).filter(u -> u.getActive() != null && u.getActive())
					.filter(u -> !existingMemberIds.contains(u.getUserId()))
					.filter(u -> !u.getUserId().equals(user.getUserId())).filter(u -> !hackathonTeamMemberRepository
							.existsByHackathonIdAndMemberId(hackathonId, u.getUserId()))
					.collect(Collectors.toList());

			inviteList = hackathonTeamInviteRepository.findByTeamIdOrderByHackathonTeamInviteIdDesc(teamId);
		} else {
			pendingInvite = hackathonTeamInviteRepository
					.findFirstByHackathonIdAndInvitedUserIdAndInviteStatus(hackathonId, user.getUserId(), "PENDING")
					.orElse(null);
			if (pendingInvite != null && pendingInvite.getTeamId() != null) {
				pendingInviteTeam = hackathonTeamRepository.findById(pendingInvite.getTeamId()).orElse(null);
			}
		}

		List<HackathonTeamEntity> availableTeams = hackathonTeamRepository.findByHackathonId(hackathonId);
		availableTeams = availableTeams.stream().filter(t -> {
			long size = hackathonTeamMemberRepository.countByTeamId(t.getHackathonTeamId());
			return opHackathon.get().getMaxTeamSize() == null || size < opHackathon.get().getMaxTeamSize();
		}).collect(Collectors.toList());
		if (hasTeam) {
			Integer myTeamId = teamId;
			availableTeams = availableTeams.stream().filter(t -> !t.getHackathonTeamId().equals(myTeamId))
					.collect(Collectors.toList());
		}

		model.addAttribute("hackathon", opHackathon.get());
		model.addAttribute("teamId", teamId);
		model.addAttribute("teamMembers", teamMembers);
		model.addAttribute("memberMap", memberMap);
		model.addAttribute("participantUsers", participantUsers);
		model.addAttribute("inviteList", inviteList);
		model.addAttribute("team", team);
		model.addAttribute("isTeamLeader", isTeamLeader);
		model.addAttribute("hasTeam", hasTeam);
		model.addAttribute("pendingInvite", pendingInvite);
		model.addAttribute("pendingInviteTeam", pendingInviteTeam);
		model.addAttribute("availableTeams", availableTeams);
		model.addAttribute("teamSizeCount", teamMembers.size());
		model.addAttribute("teamMaxSize", opHackathon.get().getMaxTeamSize());
		boolean inviteAllowed = opHackathon.get().getRegistrationEndDate() == null
				|| !LocalDate.now().isAfter(opHackathon.get().getRegistrationEndDate());
		model.addAttribute("inviteAllowed", inviteAllowed);
		model.addAttribute("success", success);
		model.addAttribute("error", error);
		return "participant/ManageTeam";
	}

	@PostMapping("participant/hackathon/{hackathonId}/team/create")
	@Transactional
	public String createTeam(@PathVariable Integer hackathonId, @RequestParam String teamName, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		if (!hackathonParticipantRepository.existsByHackathonIdAndParticipantId(hackathonId, user.getUserId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}

		Integer existingTeamId = findTeamIdForUser(hackathonId, user.getUserId());
		if (existingTeamId != null) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=alreadyInHackathon";
		}

		if (!StringUtils.hasText(teamName)) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=invalidTeamName";
		}

		HackathonTeamEntity team = new HackathonTeamEntity();
		team.setHackathonId(hackathonId);
		team.setTeamLeaderId(user.getUserId());
		team.setTeamStatus("QUALIFY");
		team.setTeamName(teamName.trim());
		hackathonTeamRepository.save(team);

		HackathonTeamMemberEntity leaderMember = new HackathonTeamMemberEntity();
		leaderMember.setTeamId(team.getHackathonTeamId());
		leaderMember.setHackathonId(hackathonId);
		leaderMember.setMemberId(user.getUserId());
		leaderMember.setRoleTitle("TEAM_LEADER");
		hackathonTeamMemberRepository.save(leaderMember);

		return "redirect:/participant/hackathon/" + hackathonId + "/team?success=teamCreated";
	}

	@PostMapping("participant/hackathon/{hackathonId}/team/join-existing")
	@Transactional
	public String joinExistingTeam(@PathVariable Integer hackathonId, @RequestParam Integer joinTeamId,
			HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		if (!hackathonParticipantRepository.existsByHackathonIdAndParticipantId(hackathonId, user.getUserId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}

		Integer existingTeamId = findTeamIdForUser(hackathonId, user.getUserId());
		if (existingTeamId != null) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=alreadyInHackathon";
		}

		Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(joinTeamId);
		if (opTeam.isEmpty() || !hackathonId.equals(opTeam.get().getHackathonId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=invalidTeam";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}
		if (opHackathon.get().getRegistrationEndDate() != null
				&& LocalDate.now().isAfter(opHackathon.get().getRegistrationEndDate())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=inviteClosed";
		}

		long teamSize = hackathonTeamMemberRepository.countByTeamId(joinTeamId);
		Integer maxSize = opHackathon.get().getMaxTeamSize();
		if (maxSize != null && teamSize >= maxSize) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=teamFull";
		}

		HackathonTeamMemberEntity member = new HackathonTeamMemberEntity();
		member.setTeamId(joinTeamId);
		member.setHackathonId(hackathonId);
		member.setMemberId(user.getUserId());
		member.setRoleTitle("MEMBER");
		hackathonTeamMemberRepository.save(member);

		return "redirect:/participant/hackathon/" + hackathonId + "/team?success=teamJoined";
	}

	@PostMapping("participant/hackathon/{hackathonId}/team/invite-member")
	@Transactional
	public String inviteRegisteredMember(@PathVariable Integer hackathonId, @RequestParam Integer invitedUserId,
			HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}
		if (opHackathon.get().getRegistrationEndDate() != null
				&& LocalDate.now().isAfter(opHackathon.get().getRegistrationEndDate())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=inviteClosed";
		}

		Integer teamId = findTeamIdForUser(hackathonId, user.getUserId());
		if (teamId == null) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}
		Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(teamId);
		if (opTeam.isEmpty() || !user.getUserId().equals(opTeam.get().getTeamLeaderId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=notLeader";
		}

		long teamSize = hackathonTeamMemberRepository.countByTeamId(teamId);
		if (opHackathon.get().getMaxTeamSize() != null && teamSize >= opHackathon.get().getMaxTeamSize()) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=teamFull";
		}

		Optional<UserEntity> opInvited = userRepository.findById(invitedUserId);
		if (opInvited.isEmpty() || !"PARTICIPANT".equals(opInvited.get().getRole())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=invalidUser";
		}

		boolean alreadyInHackathon = hackathonTeamMemberRepository.existsByHackathonIdAndMemberId(hackathonId,
				invitedUserId);
		if (alreadyInHackathon) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=alreadyInHackathon";
		}

		boolean pendingInviteExists = hackathonTeamInviteRepository
				.existsByHackathonIdAndInvitedUserIdAndInviteStatus(hackathonId, invitedUserId, "PENDING");
		if (pendingInviteExists) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=inviteExists";
		}

		HackathonTeamInviteEntity internalInvite = new HackathonTeamInviteEntity();
		internalInvite.setTeamId(teamId);
		internalInvite.setHackathonId(hackathonId);
		internalInvite.setInvitedBy(user.getUserId());
		internalInvite.setInviteType("INTERNAL");
		internalInvite.setInvitedUserId(invitedUserId);
		internalInvite.setInvitedEmail(opInvited.get().getEmail());
		internalInvite.setRoleTitle("MEMBER");
		internalInvite.setInviteStatus("PENDING");
		internalInvite.setCreatedAt(LocalDate.now());
		hackathonTeamInviteRepository.save(internalInvite);

		return "redirect:/participant/hackathon/" + hackathonId + "/team?success=memberInvited";
	}

	@PostMapping("participant/hackathon/{hackathonId}/team/invite-external")
	@Transactional
	public String inviteExternalMember(@PathVariable Integer hackathonId, @RequestParam String externalEmail,
			@RequestParam(required = false) String roleTitle, HttpSession session) {

		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}

		Integer teamId = findTeamIdForUser(hackathonId, user.getUserId());
		if (teamId == null) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}

		Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(teamId);
		if (opTeam.isEmpty() || !user.getUserId().equals(opTeam.get().getTeamLeaderId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=notLeader";
		}

		if (!StringUtils.hasText(externalEmail) || !externalEmail.contains("@")) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=invalidEmail";
		}

		HackathonTeamInviteEntity externalInvite = new HackathonTeamInviteEntity();
		externalInvite.setTeamId(teamId);
		externalInvite.setHackathonId(hackathonId);
		externalInvite.setInvitedBy(user.getUserId());
		externalInvite.setInviteType("EXTERNAL");
		externalInvite.setInvitedEmail(externalEmail.trim());
		externalInvite.setRoleTitle(StringUtils.hasText(roleTitle) ? roleTitle.trim() : "MEMBER");
		externalInvite.setInviteStatus("PENDING");
		externalInvite.setCreatedAt(LocalDate.now());

		hackathonTeamInviteRepository.save(externalInvite);

		// ✅ EMAIL SEND
		mailerService.sendForgotPasswordOtp(externalEmail);

		return "redirect:/participant/hackathon/" + hackathonId + "/team?success=externalInvited";
	}

	@PostMapping("participant/hackathon/{hackathonId}/team/remove-member")
	@Transactional
	public String removeMember(@PathVariable Integer hackathonId, @RequestParam Integer memberId, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		Integer teamId = findTeamIdForUser(hackathonId, user.getUserId());
		if (teamId == null) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}

		Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(teamId);
		if (opTeam.isEmpty() || !user.getUserId().equals(opTeam.get().getTeamLeaderId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=notLeader";
		}

		if (memberId.equals(opTeam.get().getTeamLeaderId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=cannotRemoveLeader";
		}

		Optional<HackathonTeamMemberEntity> opMember = hackathonTeamMemberRepository
				.findFirstByTeamIdAndMemberId(teamId, memberId);
		if (opMember.isEmpty()) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=memberNotFound";
		}

		hackathonTeamMemberRepository.deleteById(opMember.get().getHackathonTeamMemberId());
		return "redirect:/participant/hackathon/" + hackathonId + "/team?success=memberRemoved";
	}

	@PostMapping("participant/hackathon/{hackathonId}/invite/{inviteId}/accept")
	@Transactional
	public String acceptInvitation(@PathVariable Integer hackathonId, @PathVariable Integer inviteId,
			HttpSession session) {
		return handleInvitationResponse(hackathonId, inviteId, session, true, false);
	}

	@PostMapping("participant/hackathon/{hackathonId}/invite/{inviteId}/reject")
	@Transactional
	public String rejectInvitation(@PathVariable Integer hackathonId, @PathVariable Integer inviteId,
			HttpSession session) {
		return handleInvitationResponse(hackathonId, inviteId, session, false, false);
	}

	@PostMapping("participant/hackathon/{hackathonId}/team/invite/{inviteId}/accept")
	@Transactional
	public String acceptInvitationFromTeamPage(@PathVariable Integer hackathonId, @PathVariable Integer inviteId,
			HttpSession session) {
		return handleInvitationResponse(hackathonId, inviteId, session, true, true);
	}

	@PostMapping("participant/hackathon/{hackathonId}/team/invite/{inviteId}/reject")
	@Transactional
	public String rejectInvitationFromTeamPage(@PathVariable Integer hackathonId, @PathVariable Integer inviteId,
			HttpSession session) {
		return handleInvitationResponse(hackathonId, inviteId, session, false, true);
	}

	private String handleInvitationResponse(Integer hackathonId, Integer inviteId, HttpSession session, boolean accept,
			boolean redirectToTeamPage) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		String basePath = "redirect:/participant/hackathon/" + hackathonId;
		if (redirectToTeamPage) {
			basePath += "/team";
		}

		Optional<HackathonTeamInviteEntity> opInvite = hackathonTeamInviteRepository.findById(inviteId);
		if (opInvite.isEmpty()) {
			return basePath + "?error=inviteNotFound";
		}

		HackathonTeamInviteEntity invite = opInvite.get();
		if (!"PENDING".equals(invite.getInviteStatus()) || invite.getHackathonId() == null
				|| !invite.getHackathonId().equals(hackathonId) || invite.getInvitedUserId() == null
				|| !invite.getInvitedUserId().equals(user.getUserId())) {
			return basePath + "?error=inviteInvalid";
		}

		if (!accept) {
			invite.setInviteStatus("REJECTED");
			hackathonTeamInviteRepository.save(invite);
			return basePath + "?success=inviteRejected";
		}

		boolean alreadyInHackathon = hackathonTeamMemberRepository.existsByHackathonIdAndMemberId(hackathonId,
				user.getUserId());
		if (alreadyInHackathon) {
			invite.setInviteStatus("REJECTED");
			hackathonTeamInviteRepository.save(invite);
			return basePath + "?error=alreadyInHackathon";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}
		ensureParticipantRegistration(hackathonId, user.getUserId());

		long teamSize = hackathonTeamMemberRepository.countByTeamId(invite.getTeamId());
		Integer maxSize = opHackathon.get().getMaxTeamSize();
		if (maxSize != null && teamSize >= maxSize) {
			return basePath + "?error=teamFull";
		}

		HackathonTeamMemberEntity member = new HackathonTeamMemberEntity();
		member.setTeamId(invite.getTeamId());
		member.setHackathonId(hackathonId);
		member.setMemberId(user.getUserId());
		member.setRoleTitle(StringUtils.hasText(invite.getRoleTitle()) ? invite.getRoleTitle() : "MEMBER");
		hackathonTeamMemberRepository.save(member);

		invite.setInviteStatus("ACCEPTED");
		hackathonTeamInviteRepository.save(invite);
		return basePath + "?success=inviteAccepted";
	}

	@GetMapping("participant/hackathon/{hackathonId}/submission")
	public String openSubmission(@PathVariable Integer hackathonId, @RequestParam(required = false) String success,
			@RequestParam(required = false) String error, Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/participant/home";
		}

		Integer teamId = findTeamIdForUser(hackathonId, user.getUserId());
		if (teamId == null) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}
		Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(teamId);
		if (opTeam.isEmpty() || !user.getUserId().equals(opTeam.get().getTeamLeaderId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=notLeader";
		}

		HackathonSubmissionEntity submission = hackathonSubmissionRepository
				.findByHackathonIdAndTeamId(hackathonId, teamId).orElse(new HackathonSubmissionEntity());
		submission.setHackathonId(hackathonId);
		submission.setTeamId(teamId);

		model.addAttribute("hackathon", opHackathon.get());
		model.addAttribute("submission", submission);
		model.addAttribute("success", success);
		model.addAttribute("error", error);
		return "participant/HackathonSubmission";
	}

	@PostMapping("participant/hackathon/{hackathonId}/submission/save")
	@Transactional
	public String saveSubmission(@PathVariable Integer hackathonId, HackathonSubmissionEntity formSubmission,
			HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		Integer teamId = findTeamIdForUser(hackathonId, user.getUserId());
		if (teamId == null) {
			return "redirect:/participant/hackathon/" + hackathonId + "?error=notRegistered";
		}
		Optional<HackathonTeamEntity> opTeam = hackathonTeamRepository.findById(teamId);
		if (opTeam.isEmpty() || !user.getUserId().equals(opTeam.get().getTeamLeaderId())) {
			return "redirect:/participant/hackathon/" + hackathonId + "/team?error=notLeader";
		}

		HackathonSubmissionEntity submission = hackathonSubmissionRepository
				.findByHackathonIdAndTeamId(hackathonId, teamId).orElse(new HackathonSubmissionEntity());

		submission.setHackathonId(hackathonId);
		submission.setTeamId(teamId);
		submission.setCodeBaseUrl(formSubmission.getCodeBaseUrl());
		submission.setDocumentationUrl(formSubmission.getDocumentationUrl());
		submission.setSubmitedDate(LocalDate.now());
		hackathonSubmissionRepository.save(submission);

		return "redirect:/participant/hackathon/" + hackathonId + "/submission?success=saved";
	}

	private void ensureParticipantRegistration(Integer hackathonId, Integer userId) {
		boolean exists = hackathonParticipantRepository.existsByHackathonIdAndParticipantId(hackathonId, userId);
		if (exists) {
			return;
		}
		HackathonParticipantEntity participant = new HackathonParticipantEntity();
		participant.setHackathonId(hackathonId);
		participant.setParticipantId(userId);
		participant.setJoinedDate(LocalDate.now());
		hackathonParticipantRepository.save(participant);
	}

	private Integer findTeamIdForUser(Integer hackathonId, Integer userId) {
		Optional<HackathonTeamMemberEntity> memberRow = hackathonTeamMemberRepository
				.findFirstByHackathonIdAndMemberId(hackathonId, userId);
		if (memberRow.isPresent()) {
			return memberRow.get().getTeamId();
		}
		Optional<HackathonTeamEntity> leaderTeam = hackathonTeamRepository
				.findFirstByHackathonIdAndTeamLeaderId(hackathonId, userId);
		return leaderTeam.map(HackathonTeamEntity::getHackathonTeamId).orElse(null);
	}

	private boolean isSubmissionOpen(HackathonEntity hackathon, LocalDate today) {
		if (hackathon == null || hackathon.getRegistrationEndDate() == null) {
			return false;
		}
		return today.isAfter(hackathon.getRegistrationEndDate());
	}

}
