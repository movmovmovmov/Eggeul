package Team1.Eggeul.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Setter
@Getter
@ToString
public class BoardCriteria {

    private int pageNum;
    private int amount;

    public BoardCriteria(){
        this(1,10);
    }

    public BoardCriteria(int pageNum, int amount){
        this.pageNum = pageNum;
        this.amount = amount;

    }


    //게시물 삭제 후 페이지 번호 검색 조건 유지
    //지금 필요 없을듯..
//    public String getListLink() {
//        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
//
//        .queryParam("type", this.getType());
//
//
//        return builder.toUriString();
//    }
}
