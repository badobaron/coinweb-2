;
MyAjax = {
	defaultOption : {
		type : 'GET',
		async : true,
		cache : false,
		dataType : 'json',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8'
	},

	excute : function(paramUrl, paramData, paramRequestMethod) {
				if(paramRequestMethod === undefined){
					paramRequestMethod = 'GET';		
				}
				var paramOption = {
							   url : paramUrl, 
							   data : paramData,
						       type : paramRequestMethod
						       };
				var option = $.extend(MyAjax.defaultOption,paramOption);
				
				return  $.ajax(option);
			
		}
		
		
	};
	
	
	

	