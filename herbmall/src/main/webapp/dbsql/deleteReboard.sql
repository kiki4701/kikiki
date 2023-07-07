create or replace procedure deleteReboard --프로시저 이름 
(
--매개변수
    m_no number,
    m_step number,
    m_groupno number
)
is
--변수선언부
    cnt number;
begin
    /*
    답변이 있는 원본글인 경우에는 레코드를 삭제하지 말고 DelFlag = "Y" 로 update 
    */
    
    --원본글인 경우
    if m_step = 0 then 
        --답변글이 존재하는지 체크
        select count(*) into cnt from reboard
        where groupNo = m_groupno;
        
        --답변글이 존재하는 경우
        if cnt >1 then
            update reboard set DelFlag = 'Y'
            where no = m_no;         
        else --답변글이 없는 경우
            delete reboard where no=m_no; 
        end if; 
    else --답변글 자체인 경우
        delete reboard where no=m_no;
    end if;
    
    commit;


EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, '글 삭제 실패!');
        ROLLBACK;
end;
