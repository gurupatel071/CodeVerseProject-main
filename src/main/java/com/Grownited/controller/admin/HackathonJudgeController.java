package com.Grownited.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Grownited.entity.HackathonEntity;
import com.Grownited.entity.HackathonJudgeEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.repository.HackathonJudgeRepository;
import com.Grownited.repository.HackathonRepository;
import com.Grownited.repository.UserRepository;

@Controller
public class HackathonJudgeController {

	@Autowired
	HackathonJudgeRepository hackathonJudgeRepository;

	@Autowired
	HackathonRepository hackathonRepository;

	@Autowired
	UserRepository userRepository;

	@GetMapping("manageHackathonJudge")
	public String manageHackathonJudge(@RequestParam Integer hackathonId,
			@RequestParam(required = false) String error,
			@RequestParam(required = false) String success,
			Model model) {

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/listHackathon";
		}

		List<HackathonJudgeEntity> assignedJudges =
				hackathonJudgeRepository.findByHackathonId(hackathonId);

		Set<Integer> assignedUserIds = assignedJudges.stream()
				.map(HackathonJudgeEntity::getUserId)
				.collect(Collectors.toSet());

		Map<Integer, UserEntity> judgeMap = new HashMap<>();
		for (HackathonJudgeEntity a : assignedJudges) {
			userRepository.findById(a.getUserId())
					.ifPresent(u -> judgeMap.put(u.getUserId(), u));
		}

		// ✅ IMPORTANT FIX (active safe check)
		List<UserEntity> availableJudges = userRepository.findByRole("JUDGE").stream()
				.filter(j -> Boolean.TRUE.equals(j.getActive()))
				.filter(j -> !assignedUserIds.contains(j.getUserId()))
				.collect(Collectors.toList());

		model.addAttribute("hackathon", opHackathon.get());
		model.addAttribute("assignedJudges", assignedJudges);
		model.addAttribute("judgeMap", judgeMap);
		model.addAttribute("availableJudges", availableJudges);
		model.addAttribute("error", error);
		model.addAttribute("success", success);

		return "admin/ManageHackathonJudge";
	}

	@PostMapping("saveHackathonJudge")
	public String saveHackathonJudge(Integer hackathonId, Integer userId) {

		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		Optional<UserEntity> opJudge = userRepository.findById(userId);

		if (opHackathon.isEmpty() || opJudge.isEmpty() || !"JUDGE".equals(opJudge.get().getRole())) {
			return "redirect:/manageHackathonJudge?hackathonId=" + hackathonId + "&error=invalidJudge";
		}

		boolean duplicate = hackathonJudgeRepository
				.existsByHackathonIdAndUserId(hackathonId, userId);

		if (duplicate) {
			return "redirect:/manageHackathonJudge?hackathonId=" + hackathonId + "&error=alreadyAssigned";
		}

		HackathonJudgeEntity assign = new HackathonJudgeEntity();
		assign.setHackathonId(hackathonId);
		assign.setUserId(userId);

		hackathonJudgeRepository.save(assign);

		return "redirect:/manageHackathonJudge?hackathonId=" + hackathonId + "&success=added";
	}

	@GetMapping("deleteHackathonJudge")
	public String deleteHackathonJudge(Integer hackathonJudgeId, Integer hackathonId) {
		hackathonJudgeRepository.deleteById(hackathonJudgeId);
		return "redirect:/manageHackathonJudge?hackathonId=" + hackathonId + "&success=removed";
	}
}