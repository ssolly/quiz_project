
/* <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> */
/* ↑ 꼭 해당 jsp페이지에 있어야함 */
function daumPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log("data.userSelectType : " + data.userSelectedType)
            console.log("data.roadAddress : " + data.roadAddress)
            console.log("data.jibunAddress : " + data.jibunAddress)
            console.log("data.zoneconde(우편번호) : " + data.zonecode)
            //문장을 하나로 합치기 위해 변수 생성
            var addr=""
            if(data.userSelectedType === 'R') { //도로명
            	addr = data.roadAddress
            } else {	//지번
            	addr = data.jibunAddress
            }
            $("#addr1").val(data.zonecode)
            $("#addr2").val(addr)
            $("#addr3").focus()
        }
    }).open();
}