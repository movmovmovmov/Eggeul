package Team1.Eggeul.domain;

import lombok.Data;

@Data
public class StudySurveyVO {
    private long sn;
    private long stdSn;
    private long questionSn;
    private String question;

    public long getSn() {
        return sn;
    }

    public long getStdSn() {
        return stdSn;
    }
}

