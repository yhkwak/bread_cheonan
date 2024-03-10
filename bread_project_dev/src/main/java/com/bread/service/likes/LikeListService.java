package com.bread.service.likes;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.LikesDAO;
import com.bread.app.vo.LikesVO;

import lombok.AllArgsConstructor;

@Service("lList")
@AllArgsConstructor
public class LikeListService implements LikesService {

    private LikesDAO dao;
    
    
    @Override
    public List<LikesVO> likeList(LikesVO lvo){
		lvo.setStartIdx((lvo.getPageNum()-1)*10);
        return dao.likeList(lvo);
    }
}