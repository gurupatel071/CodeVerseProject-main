package com.Grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonEntity;

@Repository
public interface HackathonRepository extends JpaRepository<HackathonEntity, Integer>{

    long countByStatus(String status);

    long countByStatusIgnoreCase(String status);

    List<HackathonEntity> findTop5ByOrderByHackathonIdDesc();

}