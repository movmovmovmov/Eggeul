package Team1.Eggeul.controller;

import Team1.Eggeul.domain.StudyCriteria;
import Team1.Eggeul.domain.StudyListVO;
import Team1.Eggeul.service.StudyListService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/study")
@RestController
@Log4j
@AllArgsConstructor
public class StudyMemberController {

    private StudyListService service;

    @GetMapping(value="/attendList/{stdSn}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<StudyListVO>> attendList(@PathVariable("stdSn") long stdSn) {
        // 1. stdSn만 필요
        List<StudyListVO> attendantList = service.getAttendantList(stdSn);

        return new ResponseEntity<>(attendantList, HttpStatus.OK);
    }

    @GetMapping(value="/attendList/{stdSn}/{pageNum}/{amount}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<StudyListVO>> attendListWithPaging(@PathVariable("stdSn") long stdSn, @PathVariable("pageNum") int pageNum, @PathVariable("amount") int amount) {
        // 1. cri와 stdSn 필요

        StudyCriteria cri = new StudyCriteria(pageNum, amount);

        List<StudyListVO> attendantList = service.getAttendantList(cri, stdSn);

        return new ResponseEntity<>(attendantList, HttpStatus.OK);
    }

    @GetMapping(value="/waitingList/{stdSn}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<StudyListVO>> waitingList(@PathVariable("stdSn") long stdSn) {
        // 1. stdSn만 필요
        List<StudyListVO> waitingList = service.getWaitingList(stdSn);

        return new ResponseEntity<>(waitingList, HttpStatus.OK);
    }

    @GetMapping(value="/banList/{stdSn}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<StudyListVO>> banList(@PathVariable("stdSn") long stdSn) {
        // 1. stdSn만 필요
        List<StudyListVO> waitingList = service.getBanList(stdSn);

        return new ResponseEntity<>(waitingList, HttpStatus.OK);
    }
}
