function CheckAddProduct(){
	var productId = document.getElementById("productId");
	var name = document.getElementById("pname");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	var description = document.getElementById("description");
	var manufacturer = document.getElementById("manufacturer");
	var category = document.getElementById("category");	
		
	//상품명 체크
	if((name.value.length < 4) || (name.value.length > 30)){
		alert("[상품명]\n최소 4자에서 최대 30자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	
	//상품가격 체크
	if(unitPrice.value.length==0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	//상품가격 음수체크
	if(unitPrice.value.length < 0){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[가격]\n소수점 둘째 자리까지만 입력하세요."))
		return false;
	
	//상세정보 체크
	if(description.value.length==0){
		alert("[상세정보]\n 정보를 입력하세요");
		description.focus();
		return false;
	}
	
	//제조사 체크
	if(manufacturer.value.length==0){
		alert("[제조사]\n 제조사를 입력하세요");
		manufacturer.focus();
		return false;
	}
	
	//카테고리 체크
	if(category.value.length==0){
		alert("[카테고리]\n 카테고리를 입력하세요");
		category.focus();
		return false;
	}
	
	//재고 수 체크
	if(unitsInStock.value.length==0){
		alert("[재고 수]\n 재고 수를 입력하세요");
		unitsInStock.focus();
		return false;
	}
	
	//재고 수 체크
	if(isNaN(unitsInStock.value)){
		alert("[재고 수]\n숫자만 입력하세요.");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg){
		
		if(regExp.test(e.value)){
			return true;
		}		
		alert(msg);
		e.select();
		e.focus();
		return false;	
	}
	document.newProduct.submit();
}