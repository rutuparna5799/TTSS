package com.TTSS03.Controller;

import com.TTSS03.Entity.ComponentMaster;
import com.TTSS03.Service.ComponentMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/component")
public class ComponentMasterController {

    @Autowired
    private ComponentMasterService cMService;

    @PostMapping("/savecomponent")
    public ResponseEntity<ComponentMaster> create(@RequestBody ComponentMaster componentMaster) {
        try {
            ComponentMaster savedComponentMaster = cMService.saveone(componentMaster);
            return ResponseEntity.ok(savedComponentMaster);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getbyid/{sl}")
    public ResponseEntity<ComponentMaster> getById(@PathVariable("sl") int sl) {
        try {
            Optional<ComponentMaster> componentMasterOptional = cMService.getbyid(sl);
            return componentMasterOptional
                    .map(componentMaster -> ResponseEntity.ok().body(componentMaster))
                    .orElse(ResponseEntity.notFound().build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getall")
    public ResponseEntity<List<ComponentMaster>> getAll() {
        try {
            List<ComponentMaster> componentMasters = cMService.getAll();
            return ResponseEntity.ok(componentMasters);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/updatebyid/{sl}")
    public ResponseEntity<ComponentMaster> update(@PathVariable("sl") int sl, @RequestBody ComponentMaster componentMaster) {
        try {
            ComponentMaster updatedComponentMaster = cMService.update(sl, componentMaster);
            return ResponseEntity.ok(updatedComponentMaster);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/deletebyid/{sl}")
    public ResponseEntity<Void> delete(@PathVariable("sl") int sl) {
        try {
            cMService.delete(sl);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
