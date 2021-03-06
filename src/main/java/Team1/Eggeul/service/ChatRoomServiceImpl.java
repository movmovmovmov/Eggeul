package Team1.Eggeul.service;

import Team1.Eggeul.domain.ChatAttendVO;
import Team1.Eggeul.domain.ChatMessageVO;
import Team1.Eggeul.domain.ChatRoomVO;
import Team1.Eggeul.mapper.ChatMessageMapper;
import Team1.Eggeul.mapper.ChatRoomMapper;
import Team1.Eggeul.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
    public class ChatRoomServiceImpl implements ChatRoomService {
    @Setter(onMethod_ = @Autowired)
    private ChatRoomMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private ChatMessageMapper msgMapper;

    @Setter(onMethod_ = @Autowired)
    private MemberMapper memberMapper;

    @Override
    public List<ChatRoomVO> getRoomList() {
        return mapper.getRoomList();
    }

    @Override
    public List<ChatRoomVO> getRoomsOfUser(String userId) {
        return mapper.getRoomsOfUser(userId);
    }

    @Override
    public List<ChatMessageVO> getRoomListById(String userId) {

        // 해당 유저가 속한 채팅방 리스트를 가져온다.

        // 해당 유저의 최근 메시지 순으로 채팅방 정보를 뿌려준다.
        List<ChatMessageVO> roomList =  mapper.getRoomListById(userId);

        String you = "";

        // userMapper를 이용해서 name, 사진을 담기
        for(int i = 0; i < roomList.size(); i++) {
            if(userId.equals(roomList.get(i).getSenderId())) {

                you = roomList.get(i).getReceiverId();
                roomList.get(i).setYourName(memberMapper.read(you).getName());
                roomList.get(i).setYourPicture(memberMapper.read(you).getPicture());
            }else {
                you = roomList.get(i).getSenderId();
                roomList.get(i).setYourName(memberMapper.read(you).getName());
                roomList.get(i).setYourPicture(memberMapper.read(you).getPicture());
            }
        }

        return roomList;
    }

    @Transactional
    @Override
    public void registerRoom(ChatMessageVO msg){

        // 채팅방 생성
        mapper.insertRoom(msg.getChatRoomId());

        // 해당 id를 가진 채팅방에 송신자와 수신자를 등록
        mapper.insertAttendant(msg.getChatRoomId(), msg.getSenderId());
        mapper.insertAttendant(msg.getChatRoomId(), msg.getReceiverId());

        // 채팅 메시지를 등록
        msgMapper.insertMsg(msg);

    }

    @Override
    public ChatAttendVO getOldChatRoom(String me, String you) {
        return mapper.getOldChatRoom(me, you);
    }

    @Override
    public ChatAttendVO getYourId(String chatRoomId, String userId) {
        return mapper.getYourId(chatRoomId, userId);
    }
}
