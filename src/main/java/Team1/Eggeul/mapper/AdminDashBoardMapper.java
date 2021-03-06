package Team1.Eggeul.mapper;

import Team1.Eggeul.domain.DashBoardLangVO;
import Team1.Eggeul.domain.DashBoardLocaleVO;
import Team1.Eggeul.domain.DashBoardModalDataVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface AdminDashBoardMapper {

    int countTodayUserRegister();
    List<DashBoardModalDataVO> todayUserRegister();

    int countTodayGroupRegister();
    List<DashBoardModalDataVO> todayGroupRegister();

    int countTodayStudyRegister();
    List<DashBoardModalDataVO> todayStudyRegister();

    int countUserRegisterByParam(@Param("year") int year, @Param("month") int month, @Param("day") int day);

    Date test(@Param("year") int year, @Param("month") int month, @Param("day") int day);
    Date test2();

    int getVisitCount();

    int visitCountUp();

    Integer getVisitCountByTime(@Param("year") int year, @Param("month") int month, @Param("day") int day, @Param("hour") int hour);

    List<DashBoardLangVO> getDashBoardLang();

    List<DashBoardLocaleVO> getDashBoardLocale();
}
