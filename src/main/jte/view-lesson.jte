@import com.example.labeight.model.Lesson
@import java.time.LocalDate

@param Lesson lesson

<!DOCTYPE html>
<html>
<head>
    <title>${lesson.getName()} - Lesson Tracker</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        ol { margin: 20px 0; }
        li { margin: 5px 0; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<h1>${lesson.getName()} | <a href="/">Back to Home</a></h1>

@if(lesson.getAttendedDates().isEmpty())
    <p>No lessons attended yet.</p>
@else
    <ol>
        @for(LocalDate date : lesson.getAttendedDates())
            <li>${String.valueOf(date)}</li>
        @endfor
    </ol>
@endif
</body>
</html>
