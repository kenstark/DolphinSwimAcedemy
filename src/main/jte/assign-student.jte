@import com.example.labeight.model.SwimClass
@import com.example.labeight.model.Student
@param java.util.List<SwimClass> classes
@param java.util.List<Student> unassignedStudents
@param java.util.List<String> availableSessions
@param String selectedSession

@template.layout(content = @`
    <div class="container mt-4">
        <h2>Assign Students to Classes</h2>

        <div class="row mb-4">
            <div class="col-md-6">
                <form method="get" action="/classes/assign">
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
            <div class="col-md-6 text-end">
                <a href="/classes?session=${selectedSession}" class="btn btn-secondary">Back to Classes</a>
            </div>
        </div>

        @if(unassignedStudents.isEmpty())
            <div class="alert alert-info">
                All students in this session have been assigned to classes.
            </div>
        @else
            <div class="card">
                <div class="card-header">
                    <h5>Assign Student to Class</h5>
                </div>
                <div class="card-body">
                    <form method="post" action="/classes/assign">
                        <input type="hidden" name="session" value="${selectedSession}">

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Student</label>
                                    <select name="studentId" class="form-select" required>
                                        <option value="">Select Student...</option>
                                        @for(Student student : unassignedStudents)
                                            <option value="${student.getId()}">
                                                ${student.getName()} (${student.getLevel()}, Age ${student.getAge()})
                                            </option>
                                        @endfor
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Class</label>
                                    <select name="classId" class="form-select" required>
                                        <option value="">Select Class...</option>
                                        @for(SwimClass swimClass : classes)
                                            <option value="${swimClass.getId()}">
                                                ${swimClass.getLevel()} - ${swimClass.getTime()}
                                                (${swimClass.getStudentCount()} students)
                                            </option>
                                        @endfor
                                    </select>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success">Assign Student</button>
                    </form>
                </div>
            </div>
        @endif

        @if(!classes.isEmpty())
            <div class="mt-5">
                <h4>Current Class Assignments</h4>
                <div class="row">
                    @for(SwimClass swimClass : classes)
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-header bg-info text-white">
                                    <h6 class="mb-0">${swimClass.getLevel()} - ${swimClass.getTime()}</h6>
                                </div>
                                <div class="card-body">
                                    @if(swimClass.getStudents().isEmpty())
                                        <small class="text-muted">No students assigned</small>
                                    @else
                                        @for(Student student : swimClass.getStudents())
                                            <div class="small">${student.getName()} (Age ${student.getAge()})</div>
                                        @endfor
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endfor
                </div>
            </div>
        @endif
    </div>
`, title = "Assign Students - Dolphins Swim Academy")