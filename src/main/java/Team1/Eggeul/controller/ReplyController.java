package Team1.Eggeul.controller;

import Team1.Eggeul.domain.BoardCriteria;
import Team1.Eggeul.domain.ReplyVO;
import Team1.Eggeul.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/replies")
@Log4j
@AllArgsConstructor
public class ReplyController {

    private ReplyService service;

    //생성
    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    //@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<Integer> create(@RequestBody ReplyVO vo){
        ResponseEntity<Integer> result;

        log.info("ReplyVO: " + vo);
        log.info("service getReplyCnt"+service.getReplyCnt(vo.getBrdSn()));

        try{
            service.register(vo);
            result = new ResponseEntity<>(service.getReplyCnt(vo.getBrdSn()), HttpStatus.OK);

        }catch (Exception e){

            result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return result;

//        log.info("ReplyVO: " + vo);
//
//        int insertCount = service.register(vo);
//
//        log.info("Reply InsertCount: " + insertCount);
//        log.info("registerReplyCnt : "+service.getReplyCnt(vo.getBrdSn()));
//        //string success
//        return insertCount == 1
//                ? new ResponseEntity<>(service.getReplyCnt(vo.getBrdSn()), HttpStatus.OK)
//                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //댓글 삭제
    @PreAuthorize("principal.username == #reply.userId")
    @DeleteMapping(value="/{sn}/{brdSn}")
    public ResponseEntity<Integer> remove(@RequestBody ReplyVO reply, @PathVariable("sn") Long sn, @PathVariable("brdSn") Long brdSn){

        log.info("remove");
        log.info("removeUserId : " + reply.getUserId());
        log.info("replyCnt: " + service.getReplyCnt(brdSn));

        try{
            service.remove(sn);
            return new ResponseEntity<>(service.getReplyCnt(brdSn), HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
//        return service.remove(sn) == 1
//                ? new ResponseEntity<>(service.getReplyCnt(brdSn), HttpStatus.OK)
//                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    //특정 댓글 조회
    @GetMapping(value = "/{sn}")
    public ResponseEntity<ReplyVO> get(@PathVariable("sn") Long sn){

        log.info("get: " + sn);

        return new ResponseEntity<>(service.get(sn), HttpStatus.OK);
    }
    //게시물 댓글 전체 조회
    @GetMapping(value = "/pages/{brdSn}/{page}")
    public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page,
                                                 @PathVariable("brdSn") Long brdSn){

        log.info("getList--------------------");
        BoardCriteria cri = new BoardCriteria(page, 10);
        log.info(cri);

        return new ResponseEntity<>(service.getList(cri, brdSn), HttpStatus.OK);
    }

    //댓글 수정 Long
    @PreAuthorize("principal.username == #vo.userId")
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
                    value = "/{sn}")
    public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("sn") int sn){

        ResponseEntity<String> result = null;

        vo.setSn(sn);

        log.info("sn: " + sn);
        try{
            service.modify(vo);
            result = new ResponseEntity<>("ModifySuccess", HttpStatus.OK);
        }catch (Exception e){
            result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

        }

        return result;

//        return service.modify(vo) == 1
//                ? new ResponseEntity<>("success", HttpStatus.OK)
//                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
