@import com.example.labeight.model.Student
@param Student student
@param java.util.List<String> sessions

@template.layout(
content = @`
    <div class="container mt-4">
        <h2>Register</h2>

        <form method="post" action="/register">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Session</label>
                        <select name="session" class="form-select" required>
                            @for(String session : sessions)
                                <option value="${session}">${session}</option>
                            @endfor
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Time (1st Choice)</label>
                        <div class="row">
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="firstChoiceTime" value="9am" id="time1_9">
                                    <label class="form-check-label" for="time1_9">9am</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="firstChoiceTime" value="10am" id="time1_10">
                                    <label class="form-check-label" for="time1_10">10am</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="firstChoiceTime" value="1pm" id="time1_1">
                                    <label class="form-check-label" for="time1_1">1pm</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="firstChoiceTime" value="2pm" id="time1_2">
                                    <label class="form-check-label" for="time1_2">2pm</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Level:</label>
                        <select name="level" class="form-select" required>
                            <option value="Starfish">Starfish</option>
                            <option value="Minnows">Minnows</option>
                            <option value="Dolphins">Dolphins</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Birth Year</label>
                        <input type="number" name="birthYear" class="form-control" min="2010" max="2020" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Time (2nd Choice)</label>
                        <div class="row">
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="secondChoiceTime" value="9am" id="time2_9">
                                    <label class="form-check-label" for="time2_9">9am</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="secondChoiceTime" value="10am" id="time2_10">
                                    <label class="form-check-label" for="time2_10">10am</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="secondChoiceTime" value="1pm" id="time2_1">
                                    <label class="form-check-label" for="time2_1">1pm</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="secondChoiceTime" value="2pm" id="time2_2">
                                    <label class="form-check-label" for="time2_2">2pm</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>
    </div>
`,
title = "Register - Dolphins Swim Academy"
)