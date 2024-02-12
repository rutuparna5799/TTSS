package com.TTSS03.Controller;

import com.TTSS03.Entity.HeadMaster;
import com.TTSS03.Service.HeadMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/headmaster")
public class HeadMasterController {

    @Autowired
    private HeadMasterService hmService;

    @PostMapping("/saveheadmaster")
    public ResponseEntity<HeadMaster> create(@RequestBody HeadMaster headMaster) {
        try {
            HeadMaster savedHeadMaster = hmService.saveOne(headMaster);
            return ResponseEntity.ok(savedHeadMaster);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getbyid/{sl}")
    public ResponseEntity<HeadMaster> getById(@PathVariable("sl") int sl) {
        try {
            Optional<HeadMaster> headMasterOptional = hmService.getById(sl);
            return headMasterOptional
                    .map(headMaster -> ResponseEntity.ok().body(headMaster))
                    .orElse(ResponseEntity.notFound().build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getall")
    public ResponseEntity<List<HeadMaster>> getAll() {
        try {
            List<HeadMaster> headMasters = hmService.getAll();
            return ResponseEntity.ok(headMasters);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/updatebyid/{sl}")
    public ResponseEntity<HeadMaster> update(@PathVariable("sl") int sl, @RequestBody HeadMaster headMaster) {
        try {
            HeadMaster updatedHeadMaster = hmService.update(sl, headMaster);
            return ResponseEntity.ok(updatedHeadMaster);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/deletebyid/{sl}")
    public ResponseEntity<Void> delete(@PathVariable("sl") int sl) {
        try {
            hmService.delete(sl);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
