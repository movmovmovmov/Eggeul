package Team1.Eggeul.service;

import Team1.Eggeul.domain.DashBoardLangVO;
import Team1.Eggeul.domain.DashBoardLocaleVO;
import Team1.Eggeul.domain.DashBoardModalDataDTO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface AdminDashBoardService {

    int countTodayUserRegister();
    DashBoardModalDataDTO todayUserRegister();

    int countTodayGroupRegister();
    DashBoardModalDataDTO todayGroupRegister();

    int countTodayStudyRegister();
    DashBoardModalDataDTO todayStudyRegister();

    Integer[] countUserRegisterByParam(@Param("year") int year, @Param("month") int month);

    void visitCountUp();

    Integer[] getVisitCountByTime(@Param("year") int year, @Param("month") int month, @Param("day") int day);

    List<DashBoardLangVO> getDashBoardLang();

    List<DashBoardLocaleVO> getDashBoardLocale();

    Date test2();
}
