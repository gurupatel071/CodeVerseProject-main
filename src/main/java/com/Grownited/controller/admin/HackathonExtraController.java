package com.Grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Grownited.entity.HackathonDescriptionEntity;
import com.Grownited.entity.HackathonPrizeEntity;
import com.Grownited.repository.HackathonDescriptionRepository;
import com.Grownited.repository.HackathonPrizeRepository;
import com.Grownited.repository.HackathonRepository;

@Controller
@RequestMapping("/admin/hackathon")
public class HackathonExtraController {

    @Autowired
    HackathonDescriptionRepository hackathonDescriptionRepository;

    @Autowired
    HackathonPrizeRepository hackathonPrizeRepository;

    @Autowired
    HackathonRepository hackathonRepository;

    // ================== DESCRIPTION ==================

    @GetMapping("/description/new")
    public String newHackathonDescription(@RequestParam(required = false) Integer hackathonId, Model model) {
        model.addAttribute("allHackthon", hackathonRepository.findAll());
        model.addAttribute("hackathonId", hackathonId);
        return "admin/NewHackathonDescription";
    }

    @PostMapping("/description/save")
    public String saveHackathonDescription(HackathonDescriptionEntity entity) {
        hackathonDescriptionRepository.save(entity);
        return "redirect:/admin/hackathon/description/list?hackathonId=" + entity.getHackathonId();
    }

    @GetMapping("/description/list")
    public String listHackathonDescription(@RequestParam(required = false) Integer hackathonId, Model model) {

        List<HackathonDescriptionEntity> list =
                (hackathonId == null)
                        ? hackathonDescriptionRepository.findAll()
                        : hackathonDescriptionRepository.findByHackathonId(hackathonId);

        model.addAttribute("descriptionList", list);
        model.addAttribute("hackathonId", hackathonId);

        return "admin/ListHackathonDescription";
    }

    @GetMapping("/description/edit")
    public String editHackathonDescription(Integer hackathonDescriptionId, Model model) {

        HackathonDescriptionEntity data =
                hackathonDescriptionRepository.findById(hackathonDescriptionId).orElse(null);

        model.addAttribute("description", data);
        model.addAttribute("allHackthon", hackathonRepository.findAll());

        return "admin/EditHackathonDescription";
    }

    @PostMapping("/description/update")
    public String updateHackathonDescription(HackathonDescriptionEntity entity) {

        hackathonDescriptionRepository.save(entity);
        return "redirect:/admin/hackathon/description/list?hackathonId=" + entity.getHackathonId();
    }

    @GetMapping("/description/delete")
    public String deleteHackathonDescription(Integer hackathonDescriptionId,
                                             @RequestParam(required = false) Integer hackathonId) {

        if (hackathonId == null) {
            HackathonDescriptionEntity entity =
                    hackathonDescriptionRepository.findById(hackathonDescriptionId).orElse(null);

            if (entity != null) {
                hackathonId = entity.getHackathonId();
            }
        }

        hackathonDescriptionRepository.deleteById(hackathonDescriptionId);

        return "redirect:/admin/hackathon/description/list"
                + (hackathonId != null ? "?hackathonId=" + hackathonId : "");
    }

    // ================== PRIZE ==================

    @GetMapping("/prize/new")
    public String newHackathonPrize(@RequestParam(required = false) Integer hackathonId, Model model) {

        model.addAttribute("allHackthon", hackathonRepository.findAll());
        model.addAttribute("hackathonId", hackathonId);

        return "admin/NewHackathonPrize";
    }

    @PostMapping("/prize/save")
    public String saveHackathonPrize(HackathonPrizeEntity entity) {

        hackathonPrizeRepository.save(entity);
        return "redirect:/admin/hackathon/prize/list?hackathonId=" + entity.getHackathonId();
    }

    @GetMapping("/prize/list")
    public String listHackathonPrize(@RequestParam(required = false) Integer hackathonId, Model model) {

        List<HackathonPrizeEntity> list =
                (hackathonId == null)
                        ? hackathonPrizeRepository.findAll()
                        : hackathonPrizeRepository.findByHackathonId(hackathonId);

        model.addAttribute("prizeList", list);
        model.addAttribute("hackathonId", hackathonId);

        return "admin/ListHackathonPrize";
    }

    @GetMapping("/prize/edit")
    public String editHackathonPrize(Integer hackathonPrizeId, Model model) {

        HackathonPrizeEntity data =
                hackathonPrizeRepository.findById(hackathonPrizeId).orElse(null);

        model.addAttribute("prize", data);
        model.addAttribute("allHackthon", hackathonRepository.findAll());

        return "admin/EditHackathonPrize";
    }

    @PostMapping("/prize/update")
    public String updateHackathonPrize(HackathonPrizeEntity entity) {

        hackathonPrizeRepository.save(entity);
        return "redirect:/admin/hackathon/prize/list?hackathonId=" + entity.getHackathonId();
    }

    @GetMapping("/prize/delete")
    public String deleteHackathonPrize(Integer hackathonPrizeId,
                                       @RequestParam(required = false) Integer hackathonId) {

        if (hackathonId == null) {
            HackathonPrizeEntity entity =
                    hackathonPrizeRepository.findById(hackathonPrizeId).orElse(null);

            if (entity != null) {
                hackathonId = entity.getHackathonId();
            }
        }

        hackathonPrizeRepository.deleteById(hackathonPrizeId);

        return "redirect:/admin/hackathon/prize/list"
                + (hackathonId != null ? "?hackathonId=" + hackathonId : "");
    }
}