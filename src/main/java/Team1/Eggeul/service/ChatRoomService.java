package Team1.Eggeul.service;

import Team1.Eggeul.domain.ChatAttendVO;
import Team1.Eggeul.domain.ChatMessageVO;
import Team1.Eggeul.domain.ChatRoomVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChatRoomService {

    // 현재 존재하는 채팅방 리스트를 반환 (소켓용)
    public List<ChatRoomVO> getRoomList();

    public List<ChatRoomVO> getRoomsOfUser(String userId);

    // 해당 유저가 속한 채팅방 리스트를 반환
    public List<ChatMessageVO> getRoomListById(String userId);

    // 채팅방 생성 - 채팅방 생성할때 들어오는 메시지도, 유저도 함께 저장
    public void registerRoom(ChatMessageVO msg);

    // 특정유저와 내가 이전에 만든 채팅방이 있는지 확인 (있으면 채팅방 id를 반환)
    public ChatAttendVO getOldChatRoom(String me, String you);

    // 상대방의 id를 반환
    public ChatAttendVO getYourId(String chatRoomId, String userId);

}
