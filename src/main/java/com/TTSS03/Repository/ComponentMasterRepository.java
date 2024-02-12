package com.TTSS03.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ComponentMaster;

public interface ComponentMasterRepository extends JpaRepository<ComponentMaster, Integer> {

	@Modifying
    @Query("UPDATE ComponentMaster c SET c.resources = :#{#componentMaster.resources}, " +
           "c.resourceType = :#{#componentMaster.resourceType}, " +
           "c.description = :#{#componentMaster.description}, " +
           "c.resourceCode = :#{#componentMaster.resourceCode} " +
           "WHERE c.sl = :sl")
    int updateComponent(@Param("sl") int sl, @Param("componentMaster") ComponentMaster componentMaster);

}
