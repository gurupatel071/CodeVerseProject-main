package com.Grownited.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.transaction.annotation.Transactional;

import com.Grownited.entity.HackathonDescriptionEntity;
import com.Grownited.entity.HackathonEntity;
import com.Grownited.entity.HackathonJudgeEntity;
import com.Grownited.entity.HackathonPrizeEntity;
import com.Grownited.entity.UserEntity;
import com.Grownited.entity.UserTypeEntity;
import com.Grownited.repository.HackathonDescriptionRepository;
import com.Grownited.repository.HackathonJudgeRepository;
import com.Grownited.repository.HackathonPrizeRepository;
import com.Grownited.repository.HackathonRepository;
import com.Grownited.repository.UserRepository;
import com.Grownited.repository.UserTypeRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class HackathonController {

	@Autowired
	HackathonRepository hackathonRepository;
	
	@Autowired
	UserTypeRepository userTypeRepository; 

	@Autowired
	HackathonDescriptionRepository hackathonDescriptionRepository;

	@Autowired
	HackathonPrizeRepository hackathonPrizeRepository;

	@Autowired
	HackathonJudgeRepository hackathonJudgeRepository;

	@Autowired
	UserRepository userRepository;
	
	@GetMapping("newHackathon")
	public String newHackathon(Model model) {
		List<UserTypeEntity> allUserType =  userTypeRepository.findAll(); 
		model.addAttribute("allUserType",allUserType);
		return "admin/NewHackathon";
	}
	
	@PostMapping("saveHackathon")
	@Transactional
	public String saveHackathon(HackathonEntity hackathonEntity, HttpSession session,
			@RequestParam(required = false) String hackathonDetails,
			@RequestParam(required = false) String prizeTitle1,
			@RequestParam(required = false) String prizeDescription1,
			@RequestParam(required = false) String prizeTitle2,
			@RequestParam(required = false) String prizeDescription2,
			@RequestParam(required = false) String prizeTitle3,
			@RequestParam(required = false) String prizeDescription3) {
		if (hackathonEntity.getLeaderboardPublished() == null) {
			hackathonEntity.setLeaderboardPublished(false);
		}
		UserEntity currentLogInUser = (UserEntity) session.getAttribute("user");
		if (currentLogInUser != null) {
			hackathonEntity.setUserId(currentLogInUser.getUserId());
		}
		hackathonRepository.save(hackathonEntity);
		Integer hackathonId = hackathonEntity.getHackathonId();

		saveOrUpdateDescription(hackathonId, hackathonDetails);

		saveOrUpdatePrize(hackathonId, null, prizeTitle1, prizeDescription1);
		saveOrUpdatePrize(hackathonId, null, prizeTitle2, prizeDescription2);
		saveOrUpdatePrize(hackathonId, null, prizeTitle3, prizeDescription3);

		return "redirect:/listHackathon";//do not open jsp , open another url -> listHackathon
	}

	@GetMapping("listHackathon")
	public String listHackathon(@RequestParam(required = false) String success,
			@RequestParam(required = false) String error, Model model) {
		List<HackathonEntity> allHackthon =  hackathonRepository.findAll(); 
		model.addAttribute("allHackthon",allHackthon);
		model.addAttribute("success", success);
		model.addAttribute("error", error);
		return "admin/ListHackathon";
	}
	
	@GetMapping("deleteHackathon")
	public String deleteHackathon(Integer hackathonId) {
		hackathonRepository.deleteById(hackathonId);
		
		return "redirect:/listHackathon";//do not open jsp , open another url -> listHackathon
	}

	@GetMapping("viewHackathon")
	public String viewHackathon(@RequestParam Integer hackathonId, Model model) {
		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/listHackathon";
		}
		model.addAttribute("hackathon", opHackathon.get());
		Optional<HackathonDescriptionEntity> description = hackathonDescriptionRepository.findFirstByHackathonId(hackathonId);
		List<HackathonPrizeEntity> prizeList = hackathonPrizeRepository.findByHackathonIdOrderByHackathonPrizeIdAsc(hackathonId);
		List<HackathonJudgeEntity> judgeAssignments = hackathonJudgeRepository.findByHackathonId(hackathonId);
		List<UserEntity> judgeUsers = new java.util.ArrayList<>();
		for (HackathonJudgeEntity assignment : judgeAssignments) {
			userRepository.findById(assignment.getUserId()).ifPresent(judgeUsers::add);
		}
		model.addAttribute("hackathonDescription", description.orElse(null));
		model.addAttribute("prizeList", prizeList);
		model.addAttribute("judgeUsers", judgeUsers);
		return "admin/ViewHackathon";
	}

	@GetMapping("editHackathon")
	public String editHackathon(@RequestParam Integer hackathonId, Model model) {
		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/listHackathon";
		}
		List<UserTypeEntity> allUserType = userTypeRepository.findAll();
		Optional<HackathonDescriptionEntity> description = hackathonDescriptionRepository.findFirstByHackathonId(hackathonId);
		List<HackathonPrizeEntity> prizeList = hackathonPrizeRepository.findByHackathonIdOrderByHackathonPrizeIdAsc(hackathonId);
		model.addAttribute("allUserType", allUserType);
		model.addAttribute("hackathon", opHackathon.get());
		model.addAttribute("hackathonDescription", description.orElse(new HackathonDescriptionEntity()));
		model.addAttribute("prize1", getPrizeOrNew(prizeList, 0));
		model.addAttribute("prize2", getPrizeOrNew(prizeList, 1));
		model.addAttribute("prize3", getPrizeOrNew(prizeList, 2));
		return "admin/EditHackathon";
	}

	@PostMapping("updateHackathon")
	@Transactional
	public String updateHackathon(HackathonEntity hackathonEntity, HttpSession session,
			@RequestParam(required = false) String hackathonDetails,
			@RequestParam(required = false) Integer prizeId1,
			@RequestParam(required = false) String prizeTitle1,
			@RequestParam(required = false) String prizeDescription1,
			@RequestParam(required = false) Integer prizeId2,
			@RequestParam(required = false) String prizeTitle2,
			@RequestParam(required = false) String prizeDescription2,
			@RequestParam(required = false) Integer prizeId3,
			@RequestParam(required = false) String prizeTitle3,
			@RequestParam(required = false) String prizeDescription3) {
		Optional<HackathonEntity> existing = hackathonRepository.findById(hackathonEntity.getHackathonId());
		if (hackathonEntity.getLeaderboardPublished() == null && existing.isPresent()) {
			hackathonEntity.setLeaderboardPublished(existing.get().getLeaderboardPublished());
		}

		if (hackathonEntity.getUserId() == null) {
			UserEntity currentLogInUser = (UserEntity) session.getAttribute("user");
			if (currentLogInUser != null) {
				hackathonEntity.setUserId(currentLogInUser.getUserId());
			}
		}
		hackathonRepository.save(hackathonEntity);

		Integer hackathonId = hackathonEntity.getHackathonId();
		saveOrUpdateDescription(hackathonId, hackathonDetails);

		saveOrUpdatePrize(hackathonId, prizeId1, prizeTitle1, prizeDescription1);
		saveOrUpdatePrize(hackathonId, prizeId2, prizeTitle2, prizeDescription2);
		saveOrUpdatePrize(hackathonId, prizeId3, prizeTitle3, prizeDescription3);

		return "redirect:/listHackathon";
	}

	@GetMapping("toggleLeaderboardPublish")
	public String toggleLeaderboardPublish(@RequestParam Integer hackathonId) {
		Optional<HackathonEntity> opHackathon = hackathonRepository.findById(hackathonId);
		if (opHackathon.isEmpty()) {
			return "redirect:/listHackathon?error=hackathonNotFound";
		}

		HackathonEntity hackathon = opHackathon.get();
		boolean completed = "COMPLETED".equalsIgnoreCase(hackathon.getStatus())
				|| "COMPLETE".equalsIgnoreCase(hackathon.getStatus());
		if (!completed) {
			return "redirect:/listHackathon?error=leaderboardNeedsComplete";
		}

		boolean next = !Boolean.TRUE.equals(hackathon.getLeaderboardPublished());
		hackathon.setLeaderboardPublished(next);
		hackathonRepository.save(hackathon);
		return "redirect:/listHackathon?success=" + (next ? "leaderboardPublished" : "leaderboardUnpublished");
	}
	
	private void saveOrUpdateDescription(Integer hackathonId, String details) {
		if (!StringUtils.hasText(details)) {
			return;
		}
		HackathonDescriptionEntity description = hackathonDescriptionRepository.findFirstByHackathonId(hackathonId)
				.orElse(new HackathonDescriptionEntity());
		description.setHackathonId(hackathonId);
		description.setHackathonDetails(details);
		hackathonDescriptionRepository.save(description);
	}

	private void saveOrUpdatePrize(Integer hackathonId, Integer prizeId, String title, String descriptionText) {
		boolean hasData = StringUtils.hasText(title) || StringUtils.hasText(descriptionText);
		if (!hasData && prizeId == null) {
			return;
		}

		if (!hasData && prizeId != null) {
			hackathonPrizeRepository.deleteById(prizeId);
			return;
		}

		HackathonPrizeEntity prize = prizeId != null
				? hackathonPrizeRepository.findById(prizeId).orElse(new HackathonPrizeEntity())
				: new HackathonPrizeEntity();

		prize.setHackathonId(hackathonId);
		prize.setPrizeTitle(title);
		prize.setPrizeDescription(descriptionText);
		hackathonPrizeRepository.save(prize);
	}

	private HackathonPrizeEntity getPrizeOrNew(List<HackathonPrizeEntity> prizeList, int index) {
		if (prizeList.size() > index) {
			return prizeList.get(index);
		}
		return new HackathonPrizeEntity();
	}
	
	

}
