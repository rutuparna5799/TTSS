<!DOCTYPE html>
<html lang="en">
 
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Mapping Details</title>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
  
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f2f2f2;
  }
 
  #content {
    width: 60%;
    margin: 2rem auto;
    padding: 1rem;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
 
  h2 {
    text-align: center;
    margin-bottom: 1.5rem;
    color: #3366cc;
  }
 
  form {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 0;
  }
 
  label {
    font-size: 12px;
    display: block;
    margin-bottom: 8px;
    color: #333;
  }
 
  input,
  select {
    display: block;
    width: 100%;
    padding: 12px;
    font-size: 1rem;
    border-radius: 4px;
    border: 1px solid #ccc;
    margin-bottom: 16px;
    box-sizing: border-box;
  }
 
  input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.2rem;
    width: 100%;
  }
 
  input[type="submit"]:hover {
    background-color: #45a049;
  }
 
  .row {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 16px;
  }
 
  .column {
    flex: 1;
    margin-bottom: 16px;
  }
  .hidden {
    display: none;
  }
  .readonly {
    pointer-events: none; /* Disable pointer events */
    user-select: none; /* Disable selection */
    opacity: 1; /* Reduce opacity to indicate readonly state */
    /* Add any other styles you want to apply */
  }
 
  /* Custom styles for CC Fields */
  #additionalFieldsContainer ,
  #ccFieldsContainer ,
  #accFieldsContainer,
  #rpFieldsContainer,
  #ppFieldsContainer,
  #osFieldsContainer
  
  
  {
    display: flex;
    align-items: center;
    margin-bottom: 16px;
  }
 
#additionalFieldsContainer input ,
#ccFieldsContainer input ,
#accFieldsContainer input,
#rpFieldsContainer input,
#ppFieldsContainer input,
#osFieldsContainer input
 
{
    /* Your custom styles go here */
    width: 100%; /* Adjust the width based on your requirement */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    
    display: block;
     
    margin-bottom: 16px;
    box-sizing: border-box;
    /* Add more styles as needed */
  }
 
  /* Add your custom styles for labels here */
  #additionalFieldsContainer label,
  #ccFieldsContainer label,
   #accFieldsContainer label,
   #rpFieldsContainer label,
   #ppFieldsContainer label,
   #osFieldsContainer label
    {
    /* Your custom styles go here */
/*     display: block; /* Display labels as block elements */ */
    margin-bottom: 8px;
    font-weight: bold;
    color: #3366cc; /* Adjust the color based on your preference */
    /* Add more styles as needed */
  }
 
  /* Add your custom styles for the submit button here */
  #submitbtn {
    /* Your custom styles go here */
    background-color: #4CAF50;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.2rem;
    width: 100%;
    margin-top: 20px; /* Add margin to separate the submit button */
  }
 
  #submitbtn:hover {
    background-color: #45a049;
  }
</style>
 
 
</head>
 
<body>
 
  <h2>Edit Mapping Details</h2>
 
  <form action="#" method="post" id="editMapping">
  
  <div id="dynamicFieldsContainer"></div>
 
 
		<div class="row">
			<div class="column">
				<div id="additionalFieldsContainer">
					<!-- Group name will be dynamically added -->
				</div>
			</div>
		</div>
		<div class="row">
      <div class="column">
        <div id="ccFieldsContainer">
          <h3></h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="accFieldsContainer">
          <h3></h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="rpFieldsContainer">
          <h3></h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="ppFieldsContainer">
          <h3></h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="osFieldsContainer">
          <h3></h3>
        </div>
      </div>
    </div>
 
    <input type="submit" id="submitbtn" value="Update">
  </form>
 
 
    <script>
    $(document).ready(function () {
      editVenue();
 
      $('#submitbtn').click(function (event) {
        event.preventDefault();
        addData();
      });
 
      
      var fieldPrefixes = [];
      function addData() {
        var venueId = getUrlParameter('slno');
 
        $.ajax({
            type: 'GET',
            url: '/api/mapping/data?mappingcode=' + venueId,
            dataType: 'json',
            success: function (existingData) {
                var formData = {
                    slno: existingData[0].slno,
                    trainingid: existingData[0].trainingid,
                    trainingname: existingData[0].trainingname,
                    venueid: existingData[0].venueid,
                    venuename: existingData[0].venuename
                };
 					//
                
 
                fieldPrefixes.forEach(function(prefix) {
   
                    $('#' + prefix + 'FieldsContainer input').each(function() {
                        var inputId = $(this).attr('id');
                        var inputElements = document.querySelectorAll('input[id="' + inputId + '"]');

                        // Create an empty array to store the values
                        var valuesArray = [];

                        // Iterate over the selected input elements and extract their values
                        inputElements.forEach(function(inputElement) {
                            valuesArray.push(inputElement.value);
                        });
                        //console.log(inputId,valuesArray);
                        if (formData[inputId]) {
                            // Skip if the field is already present in formData
                            console.log(formData[inputId]);
                            return; // Use return instead of continue
                        } else {
      
                            if (existingData[0][inputId]) {
                            	//console.log(existingData[0][inputId],valuesArray);
                                var existingArray = existingData[0][inputId].split(',');
                                //console.log(existingArray);

                                existingArray.forEach(function(existingValue, index) {
                                    existingArray[index] = valuesArray[index];
                                });

                                var inputValue = existingArray.toString();
                                formData[inputId] = inputValue.trim();
                            }
                            else{
                            	formData[inputId] = $('#' + inputId).val() ? $('#' + inputId).val().trim() : '';

                            }
                        }
                    });
                });
                
                // Iterate over all key-value pairs in existingRecord[0]
                Object.entries(existingData[0]).forEach(([inputId, value]) => {
                    // Check if the inputId is already in formData
                    if(formData[inputId] === undefined) {
                        // If not, set its value to the corresponding value from existingRecord
                        formData[inputId] = value ? value.trim() : '';
                    }
                });


 
                // Convert formData to JSON string
                var formDataJson = JSON.stringify(formData);
                console.log(formDataJson);
                
             // Now you have the formDataJson, you can proceed with the AJAX call to update the data
                $.ajax({
                    type: 'PUT',
                    url: '/api/updateMapping/' + venueId,
                    contentType: 'application/json',
                    data: formDataJson,
                    success: function (response) {
                        toastr.success(response);
                        setTimeout(function() {
    						window.location.href = '/viewMappingTrainings.jsp';
    					}, 1000);
                    },
                    error: function () {
                        alert('Error updating data.');
                    }
                });
			},
            error: function (xhr, status, error) {
                console.error('Error fetching venue data:', xhr.responseText);
                alert('Error fetching venue data. Please check the console for details.');
            }
        });
      }
 
      function getUrlParameter(name) {
        name = name.replace(/[[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
      }
 
      function editVenue() {
        var mappingcode = getUrlParameter('slno');
 
        if (mappingcode) {
          $.ajax({
            type: 'GET',
            url: '/api/mapping/data?mappingcode=' + mappingcode,
            dataType: 'json',
            success: function (data) {
              if (data && data.length > 0) {
                var firstRecord = data[0];
                
                var dynamicFieldsContainer = $('#dynamicFieldsContainer');
                
                var fieldContainers = {
                	    'additionalFieldsContainer': ['slno', 'trainingid', 'trainingname', 'venueid', 'venuename'],
                	    'ccFieldsContainer': ['cc'],
                	    'accFieldsContainer': ['acc'],
                	    'rpFieldsContainer': ['rp'],
                	    'ppFieldsContainer': ['pp'],
                	    'osFieldsContainer': ['os']
                	};
                
                Object.keys(fieldContainers).forEach(function(containerId) {
                    // Loop through fields in the container and call createFieldsForGroup function
                    fieldContainers[containerId].forEach(function(fieldName) {
                        createFieldsForGroup(firstRecord, fieldName, containerId);
                    });
                });
              } else {
                console.error('No data found in the response.');
                alert('No data found in the response.');
              }
            },
            error: function (xhr, status, error) {
              console.error('Error fetching venue data:', xhr.responseText);
              alert('Error fetching venue data. Please check the console for details.');
            }
          });
        } else {
          // Handle the case where Venue ID is not provided in the URL
          // alert('Venue ID not provided in the URL.');
        }
      }
 
      function isFlagNo(prefix, record) {
    	  return record[prefix + "flag"] === "No";
      }
      function createFieldsForGroup(record, prefix, containerId) {
    	  if (isFlagNo(prefix, record)) {
  		    return;
  		  }else{
  			fieldPrefixes.push(prefix);
  		  }
          var dynamicFieldsContainer = $('#' + containerId);
		  $.each(record, function (key, value) {

			  var fieldContainer = $('<div class="field-container"></div>');
        	  if (containerId === 'additionalFieldsContainer') {
        		  fieldContainer.addClass('readonly');
        	  }else{
        		  if(key.includes("flag")){
                	  fieldContainer.addClass('hidden');
                  }
        	  }
        	  
              if (key.startsWith(prefix)) {
            	  
                 
                  // Add the label
                  var label = $('<label for="' + key + '">' + key + '</label>')
               
                  fieldContainer.append(label);
 
                  if (value !== null) {
                      if (typeof value === 'string' && value.includes(',')) {
                          var valuesArray = value.split(',');
                          $.each(valuesArray, function (index, val) {
                           
                              // Create separate input containers for each value in the array
                              var inputContainer = $('<div class="input-container"></div>');
                         
                              var input= $('<input type="text" id="' + key + '" value="' + val.trim() + '">');
          					  inputContainer.append(input);
                              fieldContainer.append(inputContainer);
                          });
                      } else {
                          // Create a single input container
                          var inputContainer = $('<div class="input-container"></div>');
                       
                          var input=$('<input type="text" id="' + key + '" value="' + value + '">');
                          inputContainer.append(input);
                          fieldContainer.append(inputContainer);
                      }
                  } else {
                      // Create an empty input container
                      var inputContainer = $('<div class="input-container"></div>');
                      var input=$('<input type="text" id="' + key + '" value="">')
                      inputContainer.append(input);
                      fieldContainer.append(inputContainer);
                  }
 
                  // Append the entire field container to the main container
                  dynamicFieldsContainer.append(fieldContainer);
              }
          });
      }
    });
  </script>  
</body>
 
</html>