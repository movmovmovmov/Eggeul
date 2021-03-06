package Team1.Eggeul.controller;

import Team1.Eggeul.domain.StudySurveyVO;
import Team1.Eggeul.service.StudySurveyService;
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

@RequestMapping("/study/survey")
@RestController
@Log4j
@AllArgsConstructor
public class StudySurveyController {

    private StudySurveyService service;

    @GetMapping(value="/get/{stdSn}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<StudySurveyVO>> get(@PathVariable("stdSn") long stdSn) {
        // 1. stdsn 필요

        return new ResponseEntity(service.getSurveyList(stdSn), HttpStatus.OK);
    }
}
