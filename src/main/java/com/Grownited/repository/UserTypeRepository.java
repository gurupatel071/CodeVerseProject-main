package com.Grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.UserTypeEntity;

@Repository//stereotype annotation 
public interface UserTypeRepository extends JpaRepository<UserTypeEntity, Integer>{

}