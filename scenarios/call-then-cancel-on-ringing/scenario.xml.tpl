<?xml version="1.0" encoding="ISO-8859-1" ?>
<scenario name="multi call then hangup with auth">

<send retrans="500">
  <![CDATA[
    INVITE sip:[field2]@[remote_ip]:[remote_port] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <sip:[field2]@[remote_ip]:[remote_port]>
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] INVITE
    Contact: <sip:[field0]@[local_ip]:[local_port]>
    Content-Type: application/sdp
    Content-Length: [len]

    v=0
    o=user1 53655765 2353687637 IN IP[local_ip_type] [local_ip]
    s=-
    c=IN IP[media_ip_type] [media_ip]
    t=0 0
    m=audio [media_port] RTP/AVP 3 0 8
    a=rtpmap:3 GSM/8000
    a=rtpmap:0 PCMU/8000
    a=rtpmap:8 PCMA/8000

  ]]>
</send>

<recv response="401" auth="true">
</recv>

<send>
  <![CDATA[
    ACK sip:[field2]@[remote_ip]:[remote_port] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <sip:[field2]@[remote_ip]:[remote_port]>[peer_tag_param]
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] ACK
    Content-Length: 0

  ]]>
</send>

<send retrans="500">
  <![CDATA[
    INVITE sip:[field2]@[remote_ip]:[remote_port] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <sip:[field2]@[remote_ip]:[remote_port]>
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] INVITE
    Contact: <sip:[field0]@[local_ip]:[local_port]>
    [field1]
    Content-Type: application/sdp
    Content-Length: [len]

    v=0
    o=user1 53655765 2353687637 IN IP[local_ip_type] [local_ip]
    s=-
    c=IN IP[media_ip_type] [media_ip]
    t=0 0
    m=audio [media_port] RTP/AVP 3 0 8
    a=rtpmap:3 GSM/8000
    a=rtpmap:0 PCMU/8000
    a=rtpmap:8 PCMA/8000

  ]]>
</send>

<recv response="100" optional="true">
</recv>

<recv response="180">
</recv>

{{ ring_time|sipp_pause }}

<send>
  <![CDATA[
    CANCEL sip:[field2]@[remote_ip]:[remote_port] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <sip:[field2]@[remote_ip]:[remote_port]>[peer_tag_param]
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] CANCEL
    Content-Length: 0

  ]]>
</send>

<recv response="487">
</recv>

<recv response="200">
</recv>

<send>
  <![CDATA[
    ACK sip:[field2]@[remote_ip]:[remote_port] SIP/2.0
    Via: SIP/2.0/[transport] [local_ip]:[local_port];branch=[branch]
    Max-Forwards: 70
    To: <sip:[field2]@[remote_ip]:[remote_port]>[peer_tag_param]
    From: <sip:[field0]@[local_ip]:[local_port]>;tag=[call_number]
    Call-ID: [call_id]
    CSeq: [cseq] ACK
    Content-Length: 0

  ]]>
</send>

</scenario>
