package Team1.Eggeul.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.util.List;

@Data
@Getter
@AllArgsConstructor
public class ReplyPageDTO {

    private int replyCnt;
    private List<ReplyVO> list;
}
