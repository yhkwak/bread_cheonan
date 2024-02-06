window.onload = function () {
        frm_write.addEventListener("submit",submitContents);
};

function submitContents(e) {
 // 에디터의 내용이 textarea에 적용된다.
 oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

 // 에디터의 내용에 대한 값 검증은 이곳에서
 // document.getElementById("ir1").value를 이용해서 처리한다.

 try {
     e.form.submit();
 } catch(e) {}
 }