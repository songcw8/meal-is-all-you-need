package org.example.mealisallyouneed.controller;

import org.apache.ibatis.session.SqlSession;
import org.example.mealisallyouneed.config.MyBatisConfig;
import org.example.mealisallyouneed.model.mapper.AnimeMapper;
import org.example.mealisallyouneed.model.mapper.TestMapper;
import org.example.mealisallyouneed.model.vo.Anime;
import org.example.mealisallyouneed.model.vo.AnimeRequestDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

@Controller
@RequestMapping("/")
public class IndexController {
    @GetMapping("/")
    public String index(Model model) {
        try (SqlSession session = MyBatisConfig.getSqlSessionFactory().openSession()) {
            TestMapper testMapper = session.getMapper(TestMapper.class);
            int result = testMapper.selectOnePlusOne();
            model.addAttribute("result", result);
        }
        return "index";
    }

    @PostMapping("/anime")
    public String anime(Model model, @ModelAttribute AnimeRequestDTO dto) {
        try (SqlSession session = MyBatisConfig.getSqlSessionFactory().openSession()) {
            AnimeMapper animeMapper = session.getMapper(AnimeMapper.class);
            animeMapper.insertAnime(
                    new Anime(
                            UUID.randomUUID().toString(),
                            dto.title(), dto.description(),
                            ""
                    ));

        }
        return "index";
    }
}