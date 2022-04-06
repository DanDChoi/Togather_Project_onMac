package team1.togather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupTabGallery {
    private long galseq;
    private long gseq;
    private long mnum;
    private String mname;
    private String pname;
    private int grade;
}
