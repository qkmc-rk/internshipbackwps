package org.whystudio.internship.vo;

import sun.security.provider.PolicySpiFile;

/**
 * 该类中因为涉及到JSON序列化, 所以保留了非常量变量, 仅供序列化使用, 请不要主动调用
 */
public class Const {

    public static final Integer COMMON_ERROR = -100;
    public final Integer COMMON_ERROR_ = -100;

    public static final Integer OPERATION_SUCCESS = 100;
    public final Integer OPERATION_SUCCESS_ = 100;

    /**
     * 关于登录使用的常量
     */
    public static final Integer USERNAME_NOT_FOUND = -1001;
    public final Integer USERNAME_NOT_FOUND_ = -1001;

    public static final Integer PASSWORD_WRONG = -1002;
    public final Integer PASSWORD_WRONG_ = -1002;

    public static final Integer ROLE_TYPE_WRONG = -1003;
    public final Integer ROLE_TYPE_WRONG_ = -1003;

    public static final Integer VERIFYCODE_WRONG = -1004;
    public final Integer VERIFYCODE_WRONG_ = -1004;

    public static final Integer LOGIN_SUCCESS = 1001;
    public final Integer LOGIN_SUCCESS_ = 1001;

    /**
     * 关于修改密码使用的常量
     */
    public static final Integer IDCARD_WRONG = -1005;   // 修改密码时传入的身份证号码不正确
    public final Integer IDCARD_WRONG_ = -1005;   // 修改密码时传入的身份证号码不正确
    public static final Integer FIND_PASSWORD_SUCCESS = 1009;
    public final Integer FIND_PASSWORD_SUCCESS_ = 1009;
    public static final Integer PASSWORD_INVALID = -1006;   // 密码不符合规矩
    public final Integer PASSWORD_INVALID_ = -1006;   // 密码不符合规矩

    /**
     * 关于后台使用的一些常量
     */
    public static final String TEACHER_TYPE = "teacher";
    public final String TEACHER_TYPE_ = "teacher";
    public static final String STUDENT_TYPE = "student";
    public final String STUDENT_TYPE_ = "student";


    /**
     * 优先级常量
     */
    public static final String PERFECT = "优秀";
    public final String PERFECT_ = "优秀";
    public static final String GOOD = "良好";
    public final String GOOD_ = "良好";
    public static final String USUAL = "中等";
    public final String USUAL_ = "中等";
    public static final String PASS = "及格";
    public final String PASS_ = "及格";
    public static final String NO_PASS = "不及格";
    public final String NO_PASS_ = "不及格";

    public static final int STAGE1 = 1;
    public final int STAGE1_ = 1;
    public static final int STAGE2 = 2;
    public final int STAGE2_ = 2;

    // 认证参数 管理员可以访问任何接口
    public static final int AUTH_STUDENT = 2;
    public final int _AUTH_STUDENT = 2;
    public static final int AUTH_TEACHER = 3;
    public final int _AUTH_TEACHER = 3;
    public static final int AUTH_ADMIN = 4;
    public final int _AUTH_ADMIN = 4;
    public static final int AUTH_ALL = 5;
    public final int _AUTH_ALL = 5;

    // 系统各阶段开放状态
    public static final int STAGE_ON = 1;
    public static final int STAGE_OFF = 0;
    public static final int STAGE_ONE = 1;
    public static final int STAGE_TWO = 2;
    public static final int STAGE_THREE = 3;
    public static final int STAGE_REPORT = 1;
    public static final int STAGE_APPRAISAL = 0;
    public static final int STAGE_LOGIN = 3;

    //
    public static final int STU_NO_LENGTH = 12;
}
