### Objectives

1. To measure RR, PP, and PR intervals using PhysioNet ECG data.
2. To relate temporal cardiac features to physiological parameters like heart rate.

### Theory

An ECG records heart’s electrical activity via features such as the P wave, QRS complex, and T wave.

* **RR Interval:** Time between successive R peaks; used for heart rate and arrhythmia detection.
* **PP Interval:** Time between P peaks; assesses atrial rhythm.
* **PR Interval:** Time from P wave start to QRS onset; indicates atria-to-ventricle conduction time.

Heart rate (HR) is calculated from the RR interval:

$$
HR = \frac{\text{No. of R-peaks}}{\text{Time (s)}} \times 60
$$

### Dataset Description

**MIT-BIH Arrhythmia Database** (PhysioNet) — 48 half-hour ECG recordings from 47 subjects (1975–1979).

* **Fs:** 360 Hz, \~110,000 annotations.
* \~60% inpatients, \~40% outpatients.

**Record Used:**
* 100 (files: `.atr`, `.dat`, `.hea`, `.xws`).

### Tools
* MATLAB
* WFDB Toolbox for MATLAB

### Code:
```MATLAB
[sig, Fs, tm] = rdsamp('mit bih/100', 1);
plot(sig(1:3600, 1))
time = 10; %in seconds
no_of_r_peak = 13;
HR = (no_of_r_peak/time)*60;
fprintf('Heart Rate (bpm): %.2f\n', HR);
R_Peak_positions = [78 371 664 948 1232];
rri = diff(R_Peak_positions);
RR_mean = mean(rri);
fprintf('Mean R-R Interval (samples): %.2f\n', RR_mean);
rr_mean_second = RR_mean/360;
fprintf('Mean R-R Interval (seconds): %.4f\n', rr_mean_second);
P_Peak_positions = [311 605 885 1164 1467];
ppi= diff(P_Peak_positions);
PP_mean = mean(ppi);
fprintf('Mean P-P Interval (samples): %.2f\n', PP_mean);
pp_mean_second = PP_mean/360;
fprintf('Mean P-P Interval (seconds): %.4f\n', pp_mean_second);
```

### Output 

Heart Rate: 78 bpm
Mean RR Interval: 0.8014 s
Mean PP Interval: 0.8028 s

### Result & Discussion

The analysis confirmed accurate extraction of ECG features from PhysioNet data.

* HR of 78 bpm aligns with a normal resting heart rate.
* RR and PP intervals showed consistent atrial and ventricular activity.
  This validates PhysioNet data as a reliable source for ECG studies and arrhythmia detection.

### Reference:
* PhysioNet, MIT-BIH Arrhythmia Database (2020).
