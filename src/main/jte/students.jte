@import com.example.labeight.model.Student
@param java.util.List<Student> students
@param java.util.List<String> availableSessions
@param String selectedSession

@template.layout(content = @`
    <div class="container mt-4">
        <div class="row mb-4">
            <div class="col-md-6">
                <form method="get" action="/students">
                    <div class="row">
                        <div class="col-8">
                            <select name="session" class="form-select">
                                @for(String session : availableSessions)
                                    @if(session.equals(selectedSession))
                                        <option value="${session}" selected>${session}</option>
                                    @else
                                        <option value="${session}">${session}</option>
                                    @endif
                                @endfor
                            </select>
                        </div>
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary">Select</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        @if(students.isEmpty())
            <div class="alert alert-info">
                No students found for the selected session.
            </div>
        @else
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Level</th>
                                <th>Time (1st Choice)</th>
                                <th>Time (2nd Choice)</th>
                            </tr>
                            </thead>
                            <tbody>
                            @for(Student student : students)
                                <tr>
                                    <td>${student.getId()}</td>
                                    <td>${student.getName()}</td>
                                    <td>${student.getAge()}</td>
                                    <td>${student.getLevel()}</td>
                                    <td>${student.getFirstChoiceTime()}</td>
                                    <td>${student.getSecondChoiceTime()}</td>
                                </tr>
                            @endfor
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        @endif
    </div>
`, title = "Students - Dolphins Swim Academy")