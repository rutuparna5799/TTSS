package com.TTSS03.Service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.ActualData;

public interface ActualDataService {
	
	
	ActualData saveOneData(ActualData actualData);
	
	List<ActualData>getAll();
	
	
	
	ActualData updateOne(int refplannerid,ActualData actualData);
	
	public void deactivateTraining(int refplannerid);

	ActualData getDataById(int refplannerid);
	
	//void uploadAndStoreFile(MultipartFile file) throws IOException;

	//void save(MultipartFile file);
//	 void save(MultipartFile file);
//	 ByteArrayInputStream load();
//	 List<ActualData> getAllTutorials();
	//void processExcelFile(MultipartFile file) throws IOException ;
	
	

}
