@import java.util.List
@import com.example.labeight.model.Lesson

@param List<Lesson> lessons

<!DOCTYPE html>
<html>
<head>
    <title>Lesson Tracker</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<h1>Lesson Tracker</h1>

<a href="/add">Add Lessons</a>

<table>
    <thead>
    <tr>
        <th>Lesson</th>
        <th>Remaining</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    @for(Lesson lesson : lessons)
        <tr>
            <td><a href="/view/${lesson.getName()}">${lesson.getName()}</a></td>
            <td>${lesson.getRemaining()}</td>
            <td>
                @if(lesson.getRemaining() > 0)
                    <form method="post" action="/attend/${lesson.getName()}" style="display: inline;">
                        <input type="submit" value="Attended" />
                    </form>
                @endif
            </td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
