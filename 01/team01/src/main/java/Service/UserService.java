package Service;

import DTO.Users;

public interface UserService {

	// 회원가입
	public int join(Users user);

	// 로그인
	public Users login(Users user);

	// 로그인정보가져오기
	public Users member(String userId);

}
