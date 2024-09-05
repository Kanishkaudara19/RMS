package com.kanishka.rms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kanishka.rms.dto.ReportDTO;
import com.kanishka.rms.service.ReportService;

@RestController
@RequestMapping("/report")
public class ReportController {
    @Autowired
    private final ReportService reportService;

    public ReportController(ReportService reportService) {
        this.reportService = reportService;
    }

    @GetMapping("/get")
    public ResponseEntity<ReportDTO> getReportData() {
        return ResponseEntity.ok().body(reportService.getReportData());
    }
}
