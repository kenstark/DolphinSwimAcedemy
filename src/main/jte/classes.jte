@import com.example.labeight.model.SwimClass
@import com.example.labeight.model.Student
@param java.util.List<SwimClass> classes
@param java.util.List<String> availableSessions
@param String selectedSession

@template.layout(content = @`
    <div class="container mt-4">
        <div class="row mb-4">
            <div class="col-md-8">
                <form method="get" action="/classes">
                    <div class="row">
                        <div class="col-6">
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
                        <div class="col-3">
                            <button type="submit" class="btn btn-primary">Select</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-4 text-end">
                <a href="/classes/create" class="btn btn-success me-2">Create New Class</a>
                <a href="/classes/assign?session=${selectedSession}" class="btn btn-info">Assign Students</a>
            </div>
        </div>

        @if(classes.isEmpty())
            <div class="alert alert-info">
                No classes found for the selected session.
            </div>
        @else
            <div class="row">
                @for(SwimClass swimClass : classes)
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                <h5 class="card-title mb-0">
                                    ${swimClass.getLevel()} - ${swimClass.getTime()}
                                    <span class="badge bg-light text-dark ms-2">${swimClass.getStudentCount()} students</span>
                                </h5>
                            </div>
                            <div class="card-body">
                                @if(swimClass.getStudents().isEmpty())
                                    <p class="text-muted">No students assigned to this class yet.</p>
                                @else
                                    <div class="table-responsive">
                                        <table class="table table-sm">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Age</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @for(Student student : swimClass.getStudents())
                                                <tr>
                                                    <td>${student.getId()}</td>
                                                    <td>${student.getName()}</td>
                                                    <td>${student.getAge()}</td>
                                                </tr>
                                            @endfor
                                            </tbody>
                                        </table>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                @endfor
            </div>
        @endif
    </div>
`, title = "Classes - Dolphins Swim Academy")