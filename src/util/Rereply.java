
package util;


import com.sun.scenario.animation.shared.TimerReceiver;

import java.sql.Timestamp;

/**
 * Created by Elrol on 2017/5/30.
 */
public class Rereply {
    private int rereplayId;
    private int replayId;
    private  String rereplayname;
    private String rereplayBody;
    private Timestamp rep_time;

    public int getRereplayId() {
        return rereplayId;
    }

    public void setRereplayId(int rereplayId) {
        this.rereplayId = rereplayId;
    }

    public int getReplayId() {
        return replayId;
    }

    public void setReplayId(int replayId) {
        this.replayId = replayId;
    }

    public String getRereplayname() {
        return rereplayname;
    }

    public void setRereplayname(String rereplayname) {
        this.rereplayname = rereplayname;
    }

    public String getRereplayBody() {
        return rereplayBody;
    }

    public void setRereplayBody(String rereplayBody) {
        this.rereplayBody = rereplayBody;
    }

    public Timestamp getRep_time() {
        return rep_time;
    }

    public void setRep_time(Timestamp rep_time) {
        this.rep_time = rep_time;
    }
}














