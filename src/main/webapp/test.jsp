<%@ page language="java" contentType="text/html;charset=Shift_JIS" %>
<%@ page import="java.util.Date" %>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���ь���</title>
</head>
<body>

<h1>���ь���</h1>
<% Date datex = new Date();
   out.println("<p>���������F" + datex + "</p>");

%>
<label for="studentId">�w���ԍ�����́F</label>
<input type="text" id="studentId" placeholder="�w���ԍ�����͂��Ă�������">
<button onclick="showResults()">����</button>

<h2>�w���̐��ѕ\</h2>
<table border="1">
    <thead>
    <tr>
        <th>�Ȗ�</th>
        <th>����</th>
    </tr>
    </thead>
    <tbody id="resultTableBody">
    <!-- �����Ɍ������ʂ��\������܂� -->
    </tbody>
</table>

<h2>�N���X�Ɗw�Z�̏���</h2>
<p id="classRank">�N���X���ʁF - </p>
<p id="schoolRank">�w�Z���ʁF - </p>

<script type="text/javascript">
    function showResults() {
    // ���͂��ꂽ�w���ԍ����擾
    var studentId = document.getElementById("studentId").value;

    // TODO: �w���ԍ��Ɋ�Â��Đ��тƏ��ʂ��������A�e�[�u���Ə��ʂ̕\�����X�V����JavaScript�R�[�h���L�q
    // ���ۂ̏󋵂ɍ��킹�ēK�؂�JavaScript�R�[�h���L�q���Ă�������

    // �ȉ��̓T���v���R�[�h�ł��B���ۂ̓o�b�N�G���h�̃��W�b�N�Ɋ�Â��ČĂяo���ƍX�V���s���ׂ��ł�
    var sampleData = {
    subjects: [
    { name: "����", score: 90 },
    { name: "���w", score: 85 },
    { name: "�p��", score: 88 }
    ],
    classRank: 5,
    schoolRank: 15
    };

    updateTable(sampleData.subjects);
    updateRanks(sampleData.classRank, sampleData.schoolRank);
    }

    function updateTable(subjects) {
    var tableBody = document.getElementById("resultTableBody");
    tableBody.innerHTML = ""; // �e�[�u���̓��e���N���A

    subjects.forEach(function(subject) {
    var row = document.createElement("tr");
    var cell1 = document.createElement("td");
    var cell2 = document.createElement("td");

    cell1.textContent = subject.name;
    cell2.textContent = subject.score;

    row.appendChild(cell1);
    row.appendChild(cell2);

    tableBody.appendChild(row);
    });
    }

    function updateRanks(classRank, schoolRank) {
    document.getElementById("classRank").textContent = "�N���X���ʁF<%= datex %>";
    document.getElementById("schoolRank").textContent = "�w�Z���ʁF" + schoolRank;
    }
</script>

</body>
</html>
