package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.SearchVenue;

public interface SearchVenueService {

	List<SearchVenue> findAllVenue(SearchVenue searchVenue);

	List<SearchVenue> findByVenueid(long vid);

	SearchVenue saveOnevenue(SearchVenue Searchvenue);

	void updatevenue(String vid, SearchVenue Searchvenue);

	void deActivatevenue(String vid);

	SearchVenue getVenueById(String vid);

}
