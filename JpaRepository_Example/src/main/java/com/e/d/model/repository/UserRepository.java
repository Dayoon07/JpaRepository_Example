package com.e.d.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.e.d.model.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Integer> {

}
