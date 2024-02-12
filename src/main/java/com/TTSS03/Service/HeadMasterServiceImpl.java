package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.HeadMaster;
import com.TTSS03.Repository.HeadMasterRepository;

@Service
public class HeadMasterServiceImpl implements HeadMasterService {

	@Autowired
	private HeadMasterRepository headMasterRepository;

	@Override
	public HeadMaster saveOne(HeadMaster headMaster) {
		try {
			return headMasterRepository.save(headMaster);
		} catch (Exception e) {
			throw new RuntimeException("Failed to save HeadMaster: " + e.getMessage());
		}
	}

	@Override
	public HeadMaster update(int sl, HeadMaster headMaster) {
		Optional<HeadMaster> existingHeadMasterOptional = headMasterRepository.findById(sl);
		if (existingHeadMasterOptional.isPresent()) {
			HeadMaster existingHeadMaster = existingHeadMasterOptional.get();
			// Update existingHeadMaster properties with headMaster properties
			// For example: existingHeadMaster.setName(headMaster.getName());
			try {
				return headMasterRepository.save(existingHeadMaster);
			} catch (Exception e) {
				throw new RuntimeException("Failed to update HeadMaster: " + e.getMessage());
			}
		} else {
			throw new EntityNotFoundException("HeadMaster with sl " + sl + " not found");
		}
	}

	@Override
	public Optional<HeadMaster> getById(int sl) {
		return headMasterRepository.findById(sl);
	}

	@Override
	public void delete(int sl) {
		Optional<HeadMaster> headMasterOptional = headMasterRepository.findById(sl);
		if (headMasterOptional.isPresent()) {
			HeadMaster headMaster = headMasterOptional.get();
			headMaster.setRecordstatus("Inactive");
			try {
				headMasterRepository.save(headMaster);
			} catch (Exception e) {
				throw new RuntimeException("Failed to set record status to 'Inactive' for HeadMaster with sl " + sl
						+ ": " + e.getMessage());
			}
		} else {
			throw new EntityNotFoundException("HeadMaster with sl " + sl + " not found");
		}
	}

	@Override
	public List<HeadMaster> getAll() {
		return headMasterRepository.findAll();
	}
}
