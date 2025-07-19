@import java.util.List

@param List<String> lessonNames

<!DOCTYPE html>
<html>
<head>
    <title>Add Lessons - Lesson Tracker</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { margin: 20px 0; }
        label { display: inline-block; width: 80px; margin-right: 10px; }
        input, select { margin: 5px 0; padding: 5px; }
        button { padding: 8px 16px; background-color: #007bff; color: white; border: none; cursor: pointer; }
        button:hover { background-color: #0056b3; }
    </style>
</head>
<body>
<h1>Add Lessons</h1>

<form method="post" action="/add">
    <div>
        <label>Name:</label>
        <select name="lessonSelect" id="lessonSelect" onchange="handleSelectChange()">
            <option value="">Select existing lesson...</option>
            @for(String lessonName : lessonNames)
                <option value="${lessonName}">${lessonName}</option>
            @endfor
        </select>
        or
        <input type="text" name="lessonInput" id="lessonInput" placeholder="Enter new lesson name" />
        <input type="hidden" name="name" id="finalName" />
    </div>
    <div>
        <label>Count:</label>
        <input type="number" name="count" min="1" required />
    </div>
    <button type="submit" onclick="setFinalName()">Add Lessons</button>
</form>

<script>
    function handleSelectChange() {
        const select = document.getElementById('lessonSelect');
        const input = document.getElementById('lessonInput');

        if (select.value) {
            input.value = '';
            input.disabled = true;
        } else {
            input.disabled = false;
        }
    }

    function setFinalName() {
        const select = document.getElementById('lessonSelect');
        const input = document.getElementById('lessonInput');
        const finalName = document.getElementById('finalName');

        if (select.value) {
            finalName.value = select.value;
        } else {
            finalName.value = input.value;
        }
    }

    handleSelectChange();
</script>
</body>
</html>