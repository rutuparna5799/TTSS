package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import com.TTSS03.Entity.ComponentMaster;

public interface ComponentMasterService {

	ComponentMaster saveone(ComponentMaster componentMaster);

	ComponentMaster update(int sl, ComponentMaster componentMaster );

	Optional<ComponentMaster> getbyid(int sl);

	void delete(int sl);

	List<ComponentMaster> getAll();

}
