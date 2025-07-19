@param java.util.List<String> availableSessions
@param java.util.List<String> availableLevels
@param java.util.List<String> availableTimes

@template.layout(content = @`
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2>Create New Class</h2>

                <form method="post" action="/classes/create">
                    <div class="mb-3">
                        <label class="form-label">Session</label>
                        <select name="session" class="form-select" required>
                            <option value="">Select Session...</option>
                            @for(String session : availableSessions)
                                <option value="${session}">${session}</option>
                            @endfor
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Level</label>
                        <select name="level" class="form-select" required>
                            <option value="">Select Level...</option>
                            @for(String level : availableLevels)
                                <option value="${level}">${level}</option>
                            @endfor
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Time</label>
                        <select name="time" class="form-select" required>
                            <option value="">Select Time...</option>
                            @for(String time : availableTimes)
                                <option value="${time}">${time}</option>
                            @endfor
                        </select>
                    </div>

                    <div class="mt-4">
                        <button type="submit" class="btn btn-primary">Create Class</button>
                        <a href="/classes" class="btn btn-secondary ms-2">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
`, title = "Create Class - Dolphins Swim Academy")