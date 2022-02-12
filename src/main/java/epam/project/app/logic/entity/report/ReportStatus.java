package epam.project.app.logic.entity.report;

public enum ReportStatus {
    SUBMITTED("SUBMITTED"),
    ACCEPTED("ACCEPTED"),
    UNACCEPTED("UNACCEPTED");

    private String title;

    ReportStatus(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }
}