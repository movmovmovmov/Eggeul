package Team1.Eggeul.mapper;

import Team1.Eggeul.domain.StudyCriteria;
import Team1.Eggeul.domain.StudyParamVO;
import Team1.Eggeul.domain.StudyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudyMapper {
    public List<StudyVO> getList(long grpSn);

    public List<StudyVO> getListWithPaging(@Param("cri") StudyCriteria cri, @Param("grpSn") long grpSn);

    public List<StudyVO> getPastListWithPaging(@Param("cri") StudyCriteria cri, @Param("grpSn") long grpSn);

    public int insert(StudyVO study);

    public int insertSelectKey(StudyVO study);

    public StudyVO get(Long sn);

    //스터디 내용 수정
    public int update(StudyVO study);
    
    //스터디 상태 수정
    public int updateStatus(StudyParamVO param);

    public int countStudy(long grpSn);

    public int countPastStudy(long grpSn);

}
