
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the proxy stub code */


 /* File created by MIDL compiler version 5.03.0280 */
/* at Mon Sep 24 03:45:18 2001
 */
/* Compiler settings for sample.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32 (32b run), ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#if !defined(_M_IA64) && !defined(_M_AXP64)
#define USE_STUBLESS_PROXY


/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 440
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif // __RPCPROXY_H_VERSION__


#include "sample.h"

#define TYPE_FORMAT_STRING_SIZE   1011                              
#define PROC_FORMAT_STRING_SIZE   175                               
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   2            

typedef struct _MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } MIDL_PROC_FORMAT_STRING;


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IMessenger, ver. 0.0,
   GUID={0x0089E241,0x0AE1,0x11d2,{0x9B,0x9D,0x00,0xC0,0x4F,0x8C,0x94,0xD0}} */


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IMessenger_ServerInfo;

#pragma code_seg(".orpc")
static const unsigned short IMessenger_FormatStringOffsetTable[] = 
    {
    0,
    34,
    62,
    90
    };

static const MIDL_SERVER_INFO IMessenger_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &IMessenger_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO IMessenger_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &IMessenger_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };

CINTERFACE_PROXY_VTABLE(7) _IMessengerProxyVtbl = 
{
    &IMessenger_ProxyInfo,
    &IID_IMessenger,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    (void *)-1 /* IMessenger::addListener */ ,
    (void *)-1 /* IMessenger::removeListener */ ,
    (void *)-1 /* IMessenger::sendMessage */ ,
    (void *)-1 /* IMessenger::sendObjects */
};

const CInterfaceStubVtbl _IMessengerStubVtbl =
{
    &IID_IMessenger,
    &IMessenger_ServerInfo,
    7,
    0, /* pure interpreted */
    CStdStubBuffer_METHODS
};


/* Object interface: IListener, ver. 0.0,
   GUID={0x6266E5A0,0x0BA1,0x11d2,{0xAD,0xB3,0x00,0xC0,0x4F,0x8C,0x94,0x91}} */


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IListener_ServerInfo;

#pragma code_seg(".orpc")
static const unsigned short IListener_FormatStringOffsetTable[] = 
    {
    118,
    146
    };

static const MIDL_SERVER_INFO IListener_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &IListener_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO IListener_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &IListener_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };

CINTERFACE_PROXY_VTABLE(5) _IListenerProxyVtbl = 
{
    &IListener_ProxyInfo,
    &IID_IListener,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    (void *)-1 /* IListener::processMessage */ ,
    (void *)-1 /* IListener::processObjects */
};

const CInterfaceStubVtbl _IListenerStubVtbl =
{
    &IID_IListener,
    &IListener_ServerInfo,
    5,
    0, /* pure interpreted */
    CStdStubBuffer_METHODS
};

extern const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ];

static const MIDL_STUB_DESC Object_StubDesc = 
    {
    0,
    NdrOleAllocate,
    NdrOleFree,
    0,
    0,
    0,
    0,
    0,
    __MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x20000, /* Ndr library version */
    0,
    0x5030118, /* MIDL Version 5.3.280 */
    0,
    UserMarshalRoutines,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0,  /* Reserved3 */
    0,  /* Reserved4 */
    0   /* Reserved5 */
    };

#pragma data_seg(".rdata")

static const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ] = 
        {
            
            {
            BSTR_UserSize
            ,BSTR_UserMarshal
            ,BSTR_UserUnmarshal
            ,BSTR_UserFree
            },
            {
            LPSAFEARRAY_UserSize
            ,LPSAFEARRAY_UserMarshal
            ,LPSAFEARRAY_UserUnmarshal
            ,LPSAFEARRAY_UserFree
            }

        };


#if !defined(__RPC_WIN32__)
#error  Invalid build platform for this stub.
#endif

#if !(TARGET_IS_NT40_OR_LATER)
#error You need a Windows NT 4.0 or later to run this stub because it uses these features:
#error   -Oif or -Oicf, [wire_marshal] or [user_marshal] attribute.
#error However, your C/C++ compilation flags indicate you intend to run this app on earlier systems.
#error This app will die there with the RPC_X_WRONG_STUB_VERSION error.
#endif


static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
    {
        0,
        {

	/* Procedure addListener */

			0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/*  2 */	NdrFcLong( 0x0 ),	/* 0 */
/*  6 */	NdrFcShort( 0x3 ),	/* 3 */
#ifndef _ALPHA_
/*  8 */	NdrFcShort( 0x10 ),	/* x86, MIPS, PPC Stack size/offset = 16 */
#else
			NdrFcShort( 0x20 ),	/* Alpha Stack size/offset = 32 */
#endif
/* 10 */	NdrFcShort( 0x0 ),	/* 0 */
/* 12 */	NdrFcShort( 0x8 ),	/* 8 */
/* 14 */	0x7,		/* Oi2 Flags:  srv must size, clt must size, has return, */
			0x3,		/* 3 */

	/* Parameter listener */

/* 16 */	NdrFcShort( 0xb ),	/* Flags:  must size, must free, in, */
#ifndef _ALPHA_
/* 18 */	NdrFcShort( 0x4 ),	/* x86, MIPS, PPC Stack size/offset = 4 */
#else
			NdrFcShort( 0x8 ),	/* Alpha Stack size/offset = 8 */
#endif
/* 20 */	NdrFcShort( 0x2 ),	/* Type Offset=2 */

	/* Parameter key */

/* 22 */	NdrFcShort( 0x2113 ),	/* Flags:  must size, must free, out, simple ref, srv alloc size=8 */
#ifndef _ALPHA_
/* 24 */	NdrFcShort( 0x8 ),	/* x86, MIPS, PPC Stack size/offset = 8 */
#else
			NdrFcShort( 0x10 ),	/* Alpha Stack size/offset = 16 */
#endif
/* 26 */	NdrFcShort( 0x30 ),	/* Type Offset=48 */

	/* Return value */

/* 28 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
#ifndef _ALPHA_
/* 30 */	NdrFcShort( 0xc ),	/* x86, MIPS, PPC Stack size/offset = 12 */
#else
			NdrFcShort( 0x18 ),	/* Alpha Stack size/offset = 24 */
#endif
/* 32 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure removeListener */

/* 34 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 36 */	NdrFcLong( 0x0 ),	/* 0 */
/* 40 */	NdrFcShort( 0x4 ),	/* 4 */
#ifndef _ALPHA_
/* 42 */	NdrFcShort( 0xc ),	/* x86, MIPS, PPC Stack size/offset = 12 */
#else
			NdrFcShort( 0x18 ),	/* Alpha Stack size/offset = 24 */
#endif
/* 44 */	NdrFcShort( 0x0 ),	/* 0 */
/* 46 */	NdrFcShort( 0x8 ),	/* 8 */
/* 48 */	0x6,		/* Oi2 Flags:  clt must size, has return, */
			0x2,		/* 2 */

	/* Parameter key */

/* 50 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
#ifndef _ALPHA_
/* 52 */	NdrFcShort( 0x4 ),	/* x86, MIPS, PPC Stack size/offset = 4 */
#else
			NdrFcShort( 0x8 ),	/* Alpha Stack size/offset = 8 */
#endif
/* 54 */	NdrFcShort( 0x3e ),	/* Type Offset=62 */

	/* Return value */

/* 56 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
#ifndef _ALPHA_
/* 58 */	NdrFcShort( 0x8 ),	/* x86, MIPS, PPC Stack size/offset = 8 */
#else
			NdrFcShort( 0x10 ),	/* Alpha Stack size/offset = 16 */
#endif
/* 60 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure sendMessage */

/* 62 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 64 */	NdrFcLong( 0x0 ),	/* 0 */
/* 68 */	NdrFcShort( 0x5 ),	/* 5 */
#ifndef _ALPHA_
/* 70 */	NdrFcShort( 0xc ),	/* x86, MIPS, PPC Stack size/offset = 12 */
#else
			NdrFcShort( 0x18 ),	/* Alpha Stack size/offset = 24 */
#endif
/* 72 */	NdrFcShort( 0x0 ),	/* 0 */
/* 74 */	NdrFcShort( 0x8 ),	/* 8 */
/* 76 */	0x6,		/* Oi2 Flags:  clt must size, has return, */
			0x2,		/* 2 */

	/* Parameter message */

/* 78 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
#ifndef _ALPHA_
/* 80 */	NdrFcShort( 0x4 ),	/* x86, MIPS, PPC Stack size/offset = 4 */
#else
			NdrFcShort( 0x8 ),	/* Alpha Stack size/offset = 8 */
#endif
/* 82 */	NdrFcShort( 0x3e ),	/* Type Offset=62 */

	/* Return value */

/* 84 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
#ifndef _ALPHA_
/* 86 */	NdrFcShort( 0x8 ),	/* x86, MIPS, PPC Stack size/offset = 8 */
#else
			NdrFcShort( 0x10 ),	/* Alpha Stack size/offset = 16 */
#endif
/* 88 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure sendObjects */

/* 90 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 92 */	NdrFcLong( 0x0 ),	/* 0 */
/* 96 */	NdrFcShort( 0x6 ),	/* 6 */
#ifndef _ALPHA_
/* 98 */	NdrFcShort( 0xc ),	/* x86, MIPS, PPC Stack size/offset = 12 */
#else
			NdrFcShort( 0x18 ),	/* Alpha Stack size/offset = 24 */
#endif
/* 100 */	NdrFcShort( 0x0 ),	/* 0 */
/* 102 */	NdrFcShort( 0x8 ),	/* 8 */
/* 104 */	0x6,		/* Oi2 Flags:  clt must size, has return, */
			0x2,		/* 2 */

	/* Parameter dataArray */

/* 106 */	NdrFcShort( 0x10b ),	/* Flags:  must size, must free, in, simple ref, */
#ifndef _ALPHA_
/* 108 */	NdrFcShort( 0x4 ),	/* x86, MIPS, PPC Stack size/offset = 4 */
#else
			NdrFcShort( 0x8 ),	/* Alpha Stack size/offset = 8 */
#endif
/* 110 */	NdrFcShort( 0x3e8 ),	/* Type Offset=1000 */

	/* Return value */

/* 112 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
#ifndef _ALPHA_
/* 114 */	NdrFcShort( 0x8 ),	/* x86, MIPS, PPC Stack size/offset = 8 */
#else
			NdrFcShort( 0x10 ),	/* Alpha Stack size/offset = 16 */
#endif
/* 116 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure processMessage */

/* 118 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 120 */	NdrFcLong( 0x0 ),	/* 0 */
/* 124 */	NdrFcShort( 0x3 ),	/* 3 */
#ifndef _ALPHA_
/* 126 */	NdrFcShort( 0xc ),	/* x86, MIPS, PPC Stack size/offset = 12 */
#else
			NdrFcShort( 0x18 ),	/* Alpha Stack size/offset = 24 */
#endif
/* 128 */	NdrFcShort( 0x0 ),	/* 0 */
/* 130 */	NdrFcShort( 0x8 ),	/* 8 */
/* 132 */	0x6,		/* Oi2 Flags:  clt must size, has return, */
			0x2,		/* 2 */

	/* Parameter message */

/* 134 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
#ifndef _ALPHA_
/* 136 */	NdrFcShort( 0x4 ),	/* x86, MIPS, PPC Stack size/offset = 4 */
#else
			NdrFcShort( 0x8 ),	/* Alpha Stack size/offset = 8 */
#endif
/* 138 */	NdrFcShort( 0x3e ),	/* Type Offset=62 */

	/* Return value */

/* 140 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
#ifndef _ALPHA_
/* 142 */	NdrFcShort( 0x8 ),	/* x86, MIPS, PPC Stack size/offset = 8 */
#else
			NdrFcShort( 0x10 ),	/* Alpha Stack size/offset = 16 */
#endif
/* 144 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure processObjects */

/* 146 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 148 */	NdrFcLong( 0x0 ),	/* 0 */
/* 152 */	NdrFcShort( 0x4 ),	/* 4 */
#ifndef _ALPHA_
/* 154 */	NdrFcShort( 0xc ),	/* x86, MIPS, PPC Stack size/offset = 12 */
#else
			NdrFcShort( 0x18 ),	/* Alpha Stack size/offset = 24 */
#endif
/* 156 */	NdrFcShort( 0x0 ),	/* 0 */
/* 158 */	NdrFcShort( 0x8 ),	/* 8 */
/* 160 */	0x6,		/* Oi2 Flags:  clt must size, has return, */
			0x2,		/* 2 */

	/* Parameter dataArray */

/* 162 */	NdrFcShort( 0x10b ),	/* Flags:  must size, must free, in, simple ref, */
#ifndef _ALPHA_
/* 164 */	NdrFcShort( 0x4 ),	/* x86, MIPS, PPC Stack size/offset = 4 */
#else
			NdrFcShort( 0x8 ),	/* Alpha Stack size/offset = 8 */
#endif
/* 166 */	NdrFcShort( 0x3e8 ),	/* Type Offset=1000 */

	/* Return value */

/* 168 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
#ifndef _ALPHA_
/* 170 */	NdrFcShort( 0x8 ),	/* x86, MIPS, PPC Stack size/offset = 8 */
#else
			NdrFcShort( 0x10 ),	/* Alpha Stack size/offset = 16 */
#endif
/* 172 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

			0x0
        }
    };

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/*  4 */	NdrFcLong( 0x20400 ),	/* 132096 */
/*  8 */	NdrFcShort( 0x0 ),	/* 0 */
/* 10 */	NdrFcShort( 0x0 ),	/* 0 */
/* 12 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 14 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 16 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 18 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 20 */	
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 22 */	NdrFcShort( 0x1a ),	/* Offset= 26 (48) */
/* 24 */	
			0x13, 0x0,	/* FC_OP */
/* 26 */	NdrFcShort( 0xc ),	/* Offset= 12 (38) */
/* 28 */	
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 30 */	NdrFcShort( 0x2 ),	/* 2 */
/* 32 */	0x9,		/* Corr desc: FC_ULONG */
			0x0,		/*  */
/* 34 */	NdrFcShort( 0xfffc ),	/* -4 */
/* 36 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 38 */	
			0x17,		/* FC_CSTRUCT */
			0x3,		/* 3 */
/* 40 */	NdrFcShort( 0x8 ),	/* 8 */
/* 42 */	NdrFcShort( 0xfffffff2 ),	/* Offset= -14 (28) */
/* 44 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 46 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 48 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 50 */	NdrFcShort( 0x0 ),	/* 0 */
/* 52 */	NdrFcShort( 0x4 ),	/* 4 */
/* 54 */	NdrFcShort( 0x0 ),	/* 0 */
/* 56 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (24) */
/* 58 */	
			0x12, 0x0,	/* FC_UP */
/* 60 */	NdrFcShort( 0xffffffea ),	/* Offset= -22 (38) */
/* 62 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 64 */	NdrFcShort( 0x0 ),	/* 0 */
/* 66 */	NdrFcShort( 0x4 ),	/* 4 */
/* 68 */	NdrFcShort( 0x0 ),	/* 0 */
/* 70 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (58) */
/* 72 */	
			0x11, 0x0,	/* FC_RP */
/* 74 */	NdrFcShort( 0x39e ),	/* Offset= 926 (1000) */
/* 76 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 78 */	NdrFcShort( 0x2 ),	/* Offset= 2 (80) */
/* 80 */	
			0x12, 0x0,	/* FC_UP */
/* 82 */	NdrFcShort( 0x384 ),	/* Offset= 900 (982) */
/* 84 */	
			0x2a,		/* FC_ENCAPSULATED_UNION */
			0x49,		/* 73 */
/* 86 */	NdrFcShort( 0x18 ),	/* 24 */
/* 88 */	NdrFcShort( 0xa ),	/* 10 */
/* 90 */	NdrFcLong( 0x8 ),	/* 8 */
/* 94 */	NdrFcShort( 0x58 ),	/* Offset= 88 (182) */
/* 96 */	NdrFcLong( 0xd ),	/* 13 */
/* 100 */	NdrFcShort( 0x8a ),	/* Offset= 138 (238) */
/* 102 */	NdrFcLong( 0x9 ),	/* 9 */
/* 106 */	NdrFcShort( 0xa6 ),	/* Offset= 166 (272) */
/* 108 */	NdrFcLong( 0xc ),	/* 12 */
/* 112 */	NdrFcShort( 0x274 ),	/* Offset= 628 (740) */
/* 114 */	NdrFcLong( 0x24 ),	/* 36 */
/* 118 */	NdrFcShort( 0x29c ),	/* Offset= 668 (786) */
/* 120 */	NdrFcLong( 0x800d ),	/* 32781 */
/* 124 */	NdrFcShort( 0x2b8 ),	/* Offset= 696 (820) */
/* 126 */	NdrFcLong( 0x10 ),	/* 16 */
/* 130 */	NdrFcShort( 0x2d0 ),	/* Offset= 720 (850) */
/* 132 */	NdrFcLong( 0x2 ),	/* 2 */
/* 136 */	NdrFcShort( 0x2e8 ),	/* Offset= 744 (880) */
/* 138 */	NdrFcLong( 0x3 ),	/* 3 */
/* 142 */	NdrFcShort( 0x300 ),	/* Offset= 768 (910) */
/* 144 */	NdrFcLong( 0x14 ),	/* 20 */
/* 148 */	NdrFcShort( 0x318 ),	/* Offset= 792 (940) */
/* 150 */	NdrFcShort( 0xffffffff ),	/* Offset= -1 (149) */
/* 152 */	
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 154 */	NdrFcShort( 0x4 ),	/* 4 */
/* 156 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 158 */	NdrFcShort( 0x0 ),	/* 0 */
/* 160 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 162 */	
			0x48,		/* FC_VARIABLE_REPEAT */
			0x49,		/* FC_FIXED_OFFSET */
/* 164 */	NdrFcShort( 0x4 ),	/* 4 */
/* 166 */	NdrFcShort( 0x0 ),	/* 0 */
/* 168 */	NdrFcShort( 0x1 ),	/* 1 */
/* 170 */	NdrFcShort( 0x0 ),	/* 0 */
/* 172 */	NdrFcShort( 0x0 ),	/* 0 */
/* 174 */	0x12, 0x0,	/* FC_UP */
/* 176 */	NdrFcShort( 0xffffff76 ),	/* Offset= -138 (38) */
/* 178 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 180 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 182 */	
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 184 */	NdrFcShort( 0x8 ),	/* 8 */
/* 186 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 188 */	
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 190 */	NdrFcShort( 0x4 ),	/* 4 */
/* 192 */	NdrFcShort( 0x4 ),	/* 4 */
/* 194 */	0x11, 0x0,	/* FC_RP */
/* 196 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (152) */
/* 198 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 200 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 202 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 204 */	NdrFcLong( 0x0 ),	/* 0 */
/* 208 */	NdrFcShort( 0x0 ),	/* 0 */
/* 210 */	NdrFcShort( 0x0 ),	/* 0 */
/* 212 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 214 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 216 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 218 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 220 */	
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 222 */	NdrFcShort( 0x0 ),	/* 0 */
/* 224 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 226 */	NdrFcShort( 0x0 ),	/* 0 */
/* 228 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 232 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 234 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (202) */
/* 236 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 238 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 240 */	NdrFcShort( 0x8 ),	/* 8 */
/* 242 */	NdrFcShort( 0x0 ),	/* 0 */
/* 244 */	NdrFcShort( 0x6 ),	/* Offset= 6 (250) */
/* 246 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 248 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 250 */	
			0x11, 0x0,	/* FC_RP */
/* 252 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (220) */
/* 254 */	
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 256 */	NdrFcShort( 0x0 ),	/* 0 */
/* 258 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 260 */	NdrFcShort( 0x0 ),	/* 0 */
/* 262 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 266 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 268 */	NdrFcShort( 0xfffffef6 ),	/* Offset= -266 (2) */
/* 270 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 272 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 274 */	NdrFcShort( 0x8 ),	/* 8 */
/* 276 */	NdrFcShort( 0x0 ),	/* 0 */
/* 278 */	NdrFcShort( 0x6 ),	/* Offset= 6 (284) */
/* 280 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 282 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 284 */	
			0x11, 0x0,	/* FC_RP */
/* 286 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (254) */
/* 288 */	
			0x2b,		/* FC_NON_ENCAPSULATED_UNION */
			0x9,		/* FC_ULONG */
/* 290 */	0x7,		/* Corr desc: FC_USHORT */
			0x0,		/*  */
/* 292 */	NdrFcShort( 0xfff8 ),	/* -8 */
/* 294 */	NdrFcShort( 0x2 ),	/* Offset= 2 (296) */
/* 296 */	NdrFcShort( 0x10 ),	/* 16 */
/* 298 */	NdrFcShort( 0x2b ),	/* 43 */
/* 300 */	NdrFcLong( 0x3 ),	/* 3 */
/* 304 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 306 */	NdrFcLong( 0x11 ),	/* 17 */
/* 310 */	NdrFcShort( 0x8002 ),	/* Simple arm type: FC_CHAR */
/* 312 */	NdrFcLong( 0x2 ),	/* 2 */
/* 316 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 318 */	NdrFcLong( 0x4 ),	/* 4 */
/* 322 */	NdrFcShort( 0x800a ),	/* Simple arm type: FC_FLOAT */
/* 324 */	NdrFcLong( 0x5 ),	/* 5 */
/* 328 */	NdrFcShort( 0x800c ),	/* Simple arm type: FC_DOUBLE */
/* 330 */	NdrFcLong( 0xb ),	/* 11 */
/* 334 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 336 */	NdrFcLong( 0xa ),	/* 10 */
/* 340 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 342 */	NdrFcLong( 0x6 ),	/* 6 */
/* 346 */	NdrFcShort( 0xd6 ),	/* Offset= 214 (560) */
/* 348 */	NdrFcLong( 0x7 ),	/* 7 */
/* 352 */	NdrFcShort( 0x800c ),	/* Simple arm type: FC_DOUBLE */
/* 354 */	NdrFcLong( 0x8 ),	/* 8 */
/* 358 */	NdrFcShort( 0xfffffed4 ),	/* Offset= -300 (58) */
/* 360 */	NdrFcLong( 0xd ),	/* 13 */
/* 364 */	NdrFcShort( 0xffffff5e ),	/* Offset= -162 (202) */
/* 366 */	NdrFcLong( 0x9 ),	/* 9 */
/* 370 */	NdrFcShort( 0xfffffe90 ),	/* Offset= -368 (2) */
/* 372 */	NdrFcLong( 0x2000 ),	/* 8192 */
/* 376 */	NdrFcShort( 0xbe ),	/* Offset= 190 (566) */
/* 378 */	NdrFcLong( 0x24 ),	/* 36 */
/* 382 */	NdrFcShort( 0xbc ),	/* Offset= 188 (570) */
/* 384 */	NdrFcLong( 0x4024 ),	/* 16420 */
/* 388 */	NdrFcShort( 0xb6 ),	/* Offset= 182 (570) */
/* 390 */	NdrFcLong( 0x4011 ),	/* 16401 */
/* 394 */	NdrFcShort( 0xe4 ),	/* Offset= 228 (622) */
/* 396 */	NdrFcLong( 0x4002 ),	/* 16386 */
/* 400 */	NdrFcShort( 0xe2 ),	/* Offset= 226 (626) */
/* 402 */	NdrFcLong( 0x4003 ),	/* 16387 */
/* 406 */	NdrFcShort( 0xe0 ),	/* Offset= 224 (630) */
/* 408 */	NdrFcLong( 0x4004 ),	/* 16388 */
/* 412 */	NdrFcShort( 0xde ),	/* Offset= 222 (634) */
/* 414 */	NdrFcLong( 0x4005 ),	/* 16389 */
/* 418 */	NdrFcShort( 0xdc ),	/* Offset= 220 (638) */
/* 420 */	NdrFcLong( 0x400b ),	/* 16395 */
/* 424 */	NdrFcShort( 0xca ),	/* Offset= 202 (626) */
/* 426 */	NdrFcLong( 0x400a ),	/* 16394 */
/* 430 */	NdrFcShort( 0xc8 ),	/* Offset= 200 (630) */
/* 432 */	NdrFcLong( 0x4006 ),	/* 16390 */
/* 436 */	NdrFcShort( 0xce ),	/* Offset= 206 (642) */
/* 438 */	NdrFcLong( 0x4007 ),	/* 16391 */
/* 442 */	NdrFcShort( 0xc4 ),	/* Offset= 196 (638) */
/* 444 */	NdrFcLong( 0x4008 ),	/* 16392 */
/* 448 */	NdrFcShort( 0xc6 ),	/* Offset= 198 (646) */
/* 450 */	NdrFcLong( 0x400d ),	/* 16397 */
/* 454 */	NdrFcShort( 0xc4 ),	/* Offset= 196 (650) */
/* 456 */	NdrFcLong( 0x4009 ),	/* 16393 */
/* 460 */	NdrFcShort( 0xc2 ),	/* Offset= 194 (654) */
/* 462 */	NdrFcLong( 0x6000 ),	/* 24576 */
/* 466 */	NdrFcShort( 0xc0 ),	/* Offset= 192 (658) */
/* 468 */	NdrFcLong( 0x400c ),	/* 16396 */
/* 472 */	NdrFcShort( 0xc2 ),	/* Offset= 194 (666) */
/* 474 */	NdrFcLong( 0x10 ),	/* 16 */
/* 478 */	NdrFcShort( 0x8002 ),	/* Simple arm type: FC_CHAR */
/* 480 */	NdrFcLong( 0x12 ),	/* 18 */
/* 484 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 486 */	NdrFcLong( 0x13 ),	/* 19 */
/* 490 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 492 */	NdrFcLong( 0x16 ),	/* 22 */
/* 496 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 498 */	NdrFcLong( 0x17 ),	/* 23 */
/* 502 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 504 */	NdrFcLong( 0xe ),	/* 14 */
/* 508 */	NdrFcShort( 0xa6 ),	/* Offset= 166 (674) */
/* 510 */	NdrFcLong( 0x400e ),	/* 16398 */
/* 514 */	NdrFcShort( 0xac ),	/* Offset= 172 (686) */
/* 516 */	NdrFcLong( 0x4010 ),	/* 16400 */
/* 520 */	NdrFcShort( 0x66 ),	/* Offset= 102 (622) */
/* 522 */	NdrFcLong( 0x4012 ),	/* 16402 */
/* 526 */	NdrFcShort( 0x64 ),	/* Offset= 100 (626) */
/* 528 */	NdrFcLong( 0x4013 ),	/* 16403 */
/* 532 */	NdrFcShort( 0x62 ),	/* Offset= 98 (630) */
/* 534 */	NdrFcLong( 0x4016 ),	/* 16406 */
/* 538 */	NdrFcShort( 0x5c ),	/* Offset= 92 (630) */
/* 540 */	NdrFcLong( 0x4017 ),	/* 16407 */
/* 544 */	NdrFcShort( 0x56 ),	/* Offset= 86 (630) */
/* 546 */	NdrFcLong( 0x0 ),	/* 0 */
/* 550 */	NdrFcShort( 0x0 ),	/* Offset= 0 (550) */
/* 552 */	NdrFcLong( 0x1 ),	/* 1 */
/* 556 */	NdrFcShort( 0x0 ),	/* Offset= 0 (556) */
/* 558 */	NdrFcShort( 0xffffffff ),	/* Offset= -1 (557) */
/* 560 */	
			0x15,		/* FC_STRUCT */
			0x7,		/* 7 */
/* 562 */	NdrFcShort( 0x8 ),	/* 8 */
/* 564 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 566 */	
			0x12, 0x0,	/* FC_UP */
/* 568 */	NdrFcShort( 0x19e ),	/* Offset= 414 (982) */
/* 570 */	
			0x12, 0x0,	/* FC_UP */
/* 572 */	NdrFcShort( 0x1e ),	/* Offset= 30 (602) */
/* 574 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 576 */	NdrFcLong( 0x2f ),	/* 47 */
/* 580 */	NdrFcShort( 0x0 ),	/* 0 */
/* 582 */	NdrFcShort( 0x0 ),	/* 0 */
/* 584 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 586 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 588 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 590 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 592 */	
			0x1b,		/* FC_CARRAY */
			0x0,		/* 0 */
/* 594 */	NdrFcShort( 0x1 ),	/* 1 */
/* 596 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 598 */	NdrFcShort( 0x4 ),	/* 4 */
/* 600 */	0x1,		/* FC_BYTE */
			0x5b,		/* FC_END */
/* 602 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 604 */	NdrFcShort( 0x10 ),	/* 16 */
/* 606 */	NdrFcShort( 0x0 ),	/* 0 */
/* 608 */	NdrFcShort( 0xa ),	/* Offset= 10 (618) */
/* 610 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 612 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 614 */	NdrFcShort( 0xffffffd8 ),	/* Offset= -40 (574) */
/* 616 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 618 */	
			0x12, 0x0,	/* FC_UP */
/* 620 */	NdrFcShort( 0xffffffe4 ),	/* Offset= -28 (592) */
/* 622 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 624 */	0x2,		/* FC_CHAR */
			0x5c,		/* FC_PAD */
/* 626 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 628 */	0x6,		/* FC_SHORT */
			0x5c,		/* FC_PAD */
/* 630 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 632 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */
/* 634 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 636 */	0xa,		/* FC_FLOAT */
			0x5c,		/* FC_PAD */
/* 638 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 640 */	0xc,		/* FC_DOUBLE */
			0x5c,		/* FC_PAD */
/* 642 */	
			0x12, 0x0,	/* FC_UP */
/* 644 */	NdrFcShort( 0xffffffac ),	/* Offset= -84 (560) */
/* 646 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 648 */	NdrFcShort( 0xfffffdb2 ),	/* Offset= -590 (58) */
/* 650 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 652 */	NdrFcShort( 0xfffffe3e ),	/* Offset= -450 (202) */
/* 654 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 656 */	NdrFcShort( 0xfffffd72 ),	/* Offset= -654 (2) */
/* 658 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 660 */	NdrFcShort( 0x2 ),	/* Offset= 2 (662) */
/* 662 */	
			0x12, 0x0,	/* FC_UP */
/* 664 */	NdrFcShort( 0x13e ),	/* Offset= 318 (982) */
/* 666 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 668 */	NdrFcShort( 0x2 ),	/* Offset= 2 (670) */
/* 670 */	
			0x12, 0x0,	/* FC_UP */
/* 672 */	NdrFcShort( 0x12 ),	/* Offset= 18 (690) */
/* 674 */	
			0x15,		/* FC_STRUCT */
			0x7,		/* 7 */
/* 676 */	NdrFcShort( 0x10 ),	/* 16 */
/* 678 */	0x6,		/* FC_SHORT */
			0x2,		/* FC_CHAR */
/* 680 */	0x2,		/* FC_CHAR */
			0x38,		/* FC_ALIGNM4 */
/* 682 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 684 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 686 */	
			0x12, 0x0,	/* FC_UP */
/* 688 */	NdrFcShort( 0xfffffff2 ),	/* Offset= -14 (674) */
/* 690 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x7,		/* 7 */
/* 692 */	NdrFcShort( 0x20 ),	/* 32 */
/* 694 */	NdrFcShort( 0x0 ),	/* 0 */
/* 696 */	NdrFcShort( 0x0 ),	/* Offset= 0 (696) */
/* 698 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 700 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 702 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 704 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 706 */	NdrFcShort( 0xfffffe5e ),	/* Offset= -418 (288) */
/* 708 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 710 */	
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 712 */	NdrFcShort( 0x4 ),	/* 4 */
/* 714 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 716 */	NdrFcShort( 0x0 ),	/* 0 */
/* 718 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 720 */	
			0x48,		/* FC_VARIABLE_REPEAT */
			0x49,		/* FC_FIXED_OFFSET */
/* 722 */	NdrFcShort( 0x4 ),	/* 4 */
/* 724 */	NdrFcShort( 0x0 ),	/* 0 */
/* 726 */	NdrFcShort( 0x1 ),	/* 1 */
/* 728 */	NdrFcShort( 0x0 ),	/* 0 */
/* 730 */	NdrFcShort( 0x0 ),	/* 0 */
/* 732 */	0x12, 0x0,	/* FC_UP */
/* 734 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (690) */
/* 736 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 738 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 740 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 742 */	NdrFcShort( 0x8 ),	/* 8 */
/* 744 */	NdrFcShort( 0x0 ),	/* 0 */
/* 746 */	NdrFcShort( 0x6 ),	/* Offset= 6 (752) */
/* 748 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 750 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 752 */	
			0x11, 0x0,	/* FC_RP */
/* 754 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (710) */
/* 756 */	
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 758 */	NdrFcShort( 0x4 ),	/* 4 */
/* 760 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 762 */	NdrFcShort( 0x0 ),	/* 0 */
/* 764 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 766 */	
			0x48,		/* FC_VARIABLE_REPEAT */
			0x49,		/* FC_FIXED_OFFSET */
/* 768 */	NdrFcShort( 0x4 ),	/* 4 */
/* 770 */	NdrFcShort( 0x0 ),	/* 0 */
/* 772 */	NdrFcShort( 0x1 ),	/* 1 */
/* 774 */	NdrFcShort( 0x0 ),	/* 0 */
/* 776 */	NdrFcShort( 0x0 ),	/* 0 */
/* 778 */	0x12, 0x0,	/* FC_UP */
/* 780 */	NdrFcShort( 0xffffff4e ),	/* Offset= -178 (602) */
/* 782 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 784 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 786 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 788 */	NdrFcShort( 0x8 ),	/* 8 */
/* 790 */	NdrFcShort( 0x0 ),	/* 0 */
/* 792 */	NdrFcShort( 0x6 ),	/* Offset= 6 (798) */
/* 794 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 796 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 798 */	
			0x11, 0x0,	/* FC_RP */
/* 800 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (756) */
/* 802 */	
			0x1d,		/* FC_SMFARRAY */
			0x0,		/* 0 */
/* 804 */	NdrFcShort( 0x8 ),	/* 8 */
/* 806 */	0x2,		/* FC_CHAR */
			0x5b,		/* FC_END */
/* 808 */	
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 810 */	NdrFcShort( 0x10 ),	/* 16 */
/* 812 */	0x8,		/* FC_LONG */
			0x6,		/* FC_SHORT */
/* 814 */	0x6,		/* FC_SHORT */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 816 */	0x0,		/* 0 */
			NdrFcShort( 0xfffffff1 ),	/* Offset= -15 (802) */
			0x5b,		/* FC_END */
/* 820 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 822 */	NdrFcShort( 0x18 ),	/* 24 */
/* 824 */	NdrFcShort( 0x0 ),	/* 0 */
/* 826 */	NdrFcShort( 0xa ),	/* Offset= 10 (836) */
/* 828 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 830 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 832 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (808) */
/* 834 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 836 */	
			0x11, 0x0,	/* FC_RP */
/* 838 */	NdrFcShort( 0xfffffd96 ),	/* Offset= -618 (220) */
/* 840 */	
			0x1b,		/* FC_CARRAY */
			0x0,		/* 0 */
/* 842 */	NdrFcShort( 0x1 ),	/* 1 */
/* 844 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 846 */	NdrFcShort( 0x0 ),	/* 0 */
/* 848 */	0x1,		/* FC_BYTE */
			0x5b,		/* FC_END */
/* 850 */	
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 852 */	NdrFcShort( 0x8 ),	/* 8 */
/* 854 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 856 */	
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 858 */	NdrFcShort( 0x4 ),	/* 4 */
/* 860 */	NdrFcShort( 0x4 ),	/* 4 */
/* 862 */	0x12, 0x0,	/* FC_UP */
/* 864 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (840) */
/* 866 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 868 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 870 */	
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 872 */	NdrFcShort( 0x2 ),	/* 2 */
/* 874 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 876 */	NdrFcShort( 0x0 ),	/* 0 */
/* 878 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 880 */	
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 882 */	NdrFcShort( 0x8 ),	/* 8 */
/* 884 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 886 */	
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 888 */	NdrFcShort( 0x4 ),	/* 4 */
/* 890 */	NdrFcShort( 0x4 ),	/* 4 */
/* 892 */	0x12, 0x0,	/* FC_UP */
/* 894 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (870) */
/* 896 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 898 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 900 */	
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 902 */	NdrFcShort( 0x4 ),	/* 4 */
/* 904 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 906 */	NdrFcShort( 0x0 ),	/* 0 */
/* 908 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 910 */	
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 912 */	NdrFcShort( 0x8 ),	/* 8 */
/* 914 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 916 */	
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 918 */	NdrFcShort( 0x4 ),	/* 4 */
/* 920 */	NdrFcShort( 0x4 ),	/* 4 */
/* 922 */	0x12, 0x0,	/* FC_UP */
/* 924 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (900) */
/* 926 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 928 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 930 */	
			0x1b,		/* FC_CARRAY */
			0x7,		/* 7 */
/* 932 */	NdrFcShort( 0x8 ),	/* 8 */
/* 934 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 936 */	NdrFcShort( 0x0 ),	/* 0 */
/* 938 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 940 */	
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 942 */	NdrFcShort( 0x8 ),	/* 8 */
/* 944 */	
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 946 */	
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 948 */	NdrFcShort( 0x4 ),	/* 4 */
/* 950 */	NdrFcShort( 0x4 ),	/* 4 */
/* 952 */	0x12, 0x0,	/* FC_UP */
/* 954 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (930) */
/* 956 */	
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 958 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 960 */	
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 962 */	NdrFcShort( 0x8 ),	/* 8 */
/* 964 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 966 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 968 */	
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 970 */	NdrFcShort( 0x8 ),	/* 8 */
/* 972 */	0x7,		/* Corr desc: FC_USHORT */
			0x0,		/*  */
/* 974 */	NdrFcShort( 0xffd8 ),	/* -40 */
/* 976 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 978 */	NdrFcShort( 0xffffffee ),	/* Offset= -18 (960) */
/* 980 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 982 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 984 */	NdrFcShort( 0x28 ),	/* 40 */
/* 986 */	NdrFcShort( 0xffffffee ),	/* Offset= -18 (968) */
/* 988 */	NdrFcShort( 0x0 ),	/* Offset= 0 (988) */
/* 990 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 992 */	0x38,		/* FC_ALIGNM4 */
			0x8,		/* FC_LONG */
/* 994 */	0x8,		/* FC_LONG */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 996 */	0x0,		/* 0 */
			NdrFcShort( 0xfffffc6f ),	/* Offset= -913 (84) */
			0x5b,		/* FC_END */
/* 1000 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 1002 */	NdrFcShort( 0x1 ),	/* 1 */
/* 1004 */	NdrFcShort( 0x4 ),	/* 4 */
/* 1006 */	NdrFcShort( 0x0 ),	/* 0 */
/* 1008 */	NdrFcShort( 0xfffffc5c ),	/* Offset= -932 (76) */

			0x0
        }
    };

const CInterfaceProxyVtbl * _sample_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_IMessengerProxyVtbl,
    ( CInterfaceProxyVtbl *) &_IListenerProxyVtbl,
    0
};

const CInterfaceStubVtbl * _sample_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_IMessengerStubVtbl,
    ( CInterfaceStubVtbl *) &_IListenerStubVtbl,
    0
};

PCInterfaceName const _sample_InterfaceNamesList[] = 
{
    "IMessenger",
    "IListener",
    0
};


#define _sample_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _sample, pIID, n)

int __stdcall _sample_IID_Lookup( const IID * pIID, int * pIndex )
{
    IID_BS_LOOKUP_SETUP

    IID_BS_LOOKUP_INITIAL_TEST( _sample, 2, 1 )
    IID_BS_LOOKUP_RETURN_RESULT( _sample, 2, *pIndex )
    
}

const ExtendedProxyFileInfo sample_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _sample_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _sample_StubVtblList,
    (const PCInterfaceName * ) & _sample_InterfaceNamesList,
    0, // no delegation
    & _sample_IID_Lookup, 
    2,
    2,
    0, /* table of [async_uuid] interfaces */
    0, /* Filler1 */
    0, /* Filler2 */
    0  /* Filler3 */
};


#endif /* !defined(_M_IA64) && !defined(_M_AXP64)*/


#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the proxy stub code */


 /* File created by MIDL compiler version 5.03.0280 */
/* at Mon Sep 24 03:45:18 2001
 */
/* Compiler settings for sample.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win64 (32b run,appending), ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#if defined(_M_IA64) || defined(_M_AXP64)
#define USE_STUBLESS_PROXY


/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 475
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif // __RPCPROXY_H_VERSION__


#include "sample.h"

#define TYPE_FORMAT_STRING_SIZE   993                               
#define PROC_FORMAT_STRING_SIZE   235                               
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   2            

typedef struct _MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } MIDL_PROC_FORMAT_STRING;


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IMessenger, ver. 0.0,
   GUID={0x0089E241,0x0AE1,0x11d2,{0x9B,0x9D,0x00,0xC0,0x4F,0x8C,0x94,0xD0}} */


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IMessenger_ServerInfo;

#pragma code_seg(".orpc")
static const unsigned short IMessenger_FormatStringOffsetTable[] = 
    {
    0,
    44,
    82,
    120
    };

static const MIDL_SERVER_INFO IMessenger_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &IMessenger_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO IMessenger_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &IMessenger_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };

CINTERFACE_PROXY_VTABLE(7) _IMessengerProxyVtbl = 
{
    &IMessenger_ProxyInfo,
    &IID_IMessenger,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    (void *)-1 /* IMessenger::addListener */ ,
    (void *)-1 /* IMessenger::removeListener */ ,
    (void *)-1 /* IMessenger::sendMessage */ ,
    (void *)-1 /* IMessenger::sendObjects */
};

const CInterfaceStubVtbl _IMessengerStubVtbl =
{
    &IID_IMessenger,
    &IMessenger_ServerInfo,
    7,
    0, /* pure interpreted */
    CStdStubBuffer_METHODS
};


/* Object interface: IListener, ver. 0.0,
   GUID={0x6266E5A0,0x0BA1,0x11d2,{0xAD,0xB3,0x00,0xC0,0x4F,0x8C,0x94,0x91}} */


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IListener_ServerInfo;

#pragma code_seg(".orpc")
static const unsigned short IListener_FormatStringOffsetTable[] = 
    {
    158,
    196
    };

static const MIDL_SERVER_INFO IListener_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &IListener_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO IListener_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &IListener_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };

CINTERFACE_PROXY_VTABLE(5) _IListenerProxyVtbl = 
{
    &IListener_ProxyInfo,
    &IID_IListener,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    (void *)-1 /* IListener::processMessage */ ,
    (void *)-1 /* IListener::processObjects */
};

const CInterfaceStubVtbl _IListenerStubVtbl =
{
    &IID_IListener,
    &IListener_ServerInfo,
    5,
    0, /* pure interpreted */
    CStdStubBuffer_METHODS
};

extern const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ];

static const MIDL_STUB_DESC Object_StubDesc = 
    {
    0,
    NdrOleAllocate,
    NdrOleFree,
    0,
    0,
    0,
    0,
    0,
    __MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x50002, /* Ndr library version */
    0,
    0x5030118, /* MIDL Version 5.3.280 */
    0,
    UserMarshalRoutines,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0,  /* Reserved3 */
    0,  /* Reserved4 */
    0   /* Reserved5 */
    };

#pragma data_seg(".rdata")

static const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ] = 
        {
            
            {
            BSTR_UserSize
            ,BSTR_UserMarshal
            ,BSTR_UserUnmarshal
            ,BSTR_UserFree
            },
            {
            LPSAFEARRAY_UserSize
            ,LPSAFEARRAY_UserMarshal
            ,LPSAFEARRAY_UserUnmarshal
            ,LPSAFEARRAY_UserFree
            }

        };


#if !defined(__RPC_WIN64__)
#error  Invalid build platform for this stub.
#endif

static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
    {
        0,
        {

	/* Procedure addListener */

			0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/*  2 */	NdrFcLong( 0x0 ),	/* 0 */
/*  6 */	NdrFcShort( 0x3 ),	/* 3 */
/*  8 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 10 */	NdrFcShort( 0x0 ),	/* 0 */
/* 12 */	NdrFcShort( 0x8 ),	/* 8 */
/* 14 */	0x47,		/* Oi2 Flags:  srv must size, clt must size, has return, has ext, */
			0x3,		/* 3 */
/* 16 */	0xa,		/* 10 */
			0x3,		/* Ext Flags:  new corr desc, clt corr check, */
/* 18 */	NdrFcShort( 0x1 ),	/* 1 */
/* 20 */	NdrFcShort( 0x0 ),	/* 0 */
/* 22 */	NdrFcShort( 0x0 ),	/* 0 */
/* 24 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter listener */

/* 26 */	NdrFcShort( 0xb ),	/* Flags:  must size, must free, in, */
/* 28 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 30 */	NdrFcShort( 0x2 ),	/* Type Offset=2 */

	/* Parameter key */

/* 32 */	NdrFcShort( 0x2113 ),	/* Flags:  must size, must free, out, simple ref, srv alloc size=8 */
/* 34 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 36 */	NdrFcShort( 0x32 ),	/* Type Offset=50 */

	/* Return value */

/* 38 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 40 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 42 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure removeListener */

/* 44 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 46 */	NdrFcLong( 0x0 ),	/* 0 */
/* 50 */	NdrFcShort( 0x4 ),	/* 4 */
/* 52 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 54 */	NdrFcShort( 0x0 ),	/* 0 */
/* 56 */	NdrFcShort( 0x8 ),	/* 8 */
/* 58 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x2,		/* 2 */
/* 60 */	0xa,		/* 10 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 62 */	NdrFcShort( 0x0 ),	/* 0 */
/* 64 */	NdrFcShort( 0x1 ),	/* 1 */
/* 66 */	NdrFcShort( 0x0 ),	/* 0 */
/* 68 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter key */

/* 70 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 72 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 74 */	NdrFcShort( 0x40 ),	/* Type Offset=64 */

	/* Return value */

/* 76 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 78 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 80 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure sendMessage */

/* 82 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 84 */	NdrFcLong( 0x0 ),	/* 0 */
/* 88 */	NdrFcShort( 0x5 ),	/* 5 */
/* 90 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 92 */	NdrFcShort( 0x0 ),	/* 0 */
/* 94 */	NdrFcShort( 0x8 ),	/* 8 */
/* 96 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x2,		/* 2 */
/* 98 */	0xa,		/* 10 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 100 */	NdrFcShort( 0x0 ),	/* 0 */
/* 102 */	NdrFcShort( 0x1 ),	/* 1 */
/* 104 */	NdrFcShort( 0x0 ),	/* 0 */
/* 106 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter message */

/* 108 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 110 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 112 */	NdrFcShort( 0x40 ),	/* Type Offset=64 */

	/* Return value */

/* 114 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 116 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 118 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure sendObjects */

/* 120 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 122 */	NdrFcLong( 0x0 ),	/* 0 */
/* 126 */	NdrFcShort( 0x6 ),	/* 6 */
/* 128 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 130 */	NdrFcShort( 0x0 ),	/* 0 */
/* 132 */	NdrFcShort( 0x8 ),	/* 8 */
/* 134 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x2,		/* 2 */
/* 136 */	0xa,		/* 10 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 138 */	NdrFcShort( 0x0 ),	/* 0 */
/* 140 */	NdrFcShort( 0x12 ),	/* 18 */
/* 142 */	NdrFcShort( 0x0 ),	/* 0 */
/* 144 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter dataArray */

/* 146 */	NdrFcShort( 0x10b ),	/* Flags:  must size, must free, in, simple ref, */
/* 148 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 150 */	NdrFcShort( 0x3d6 ),	/* Type Offset=982 */

	/* Return value */

/* 152 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 154 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 156 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure processMessage */

/* 158 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 160 */	NdrFcLong( 0x0 ),	/* 0 */
/* 164 */	NdrFcShort( 0x3 ),	/* 3 */
/* 166 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 168 */	NdrFcShort( 0x0 ),	/* 0 */
/* 170 */	NdrFcShort( 0x8 ),	/* 8 */
/* 172 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x2,		/* 2 */
/* 174 */	0xa,		/* 10 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 176 */	NdrFcShort( 0x0 ),	/* 0 */
/* 178 */	NdrFcShort( 0x1 ),	/* 1 */
/* 180 */	NdrFcShort( 0x0 ),	/* 0 */
/* 182 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter message */

/* 184 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 186 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 188 */	NdrFcShort( 0x40 ),	/* Type Offset=64 */

	/* Return value */

/* 190 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 192 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 194 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure processObjects */

/* 196 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 198 */	NdrFcLong( 0x0 ),	/* 0 */
/* 202 */	NdrFcShort( 0x4 ),	/* 4 */
/* 204 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 206 */	NdrFcShort( 0x0 ),	/* 0 */
/* 208 */	NdrFcShort( 0x8 ),	/* 8 */
/* 210 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x2,		/* 2 */
/* 212 */	0xa,		/* 10 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 214 */	NdrFcShort( 0x0 ),	/* 0 */
/* 216 */	NdrFcShort( 0x12 ),	/* 18 */
/* 218 */	NdrFcShort( 0x0 ),	/* 0 */
/* 220 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter dataArray */

/* 222 */	NdrFcShort( 0x10b ),	/* Flags:  must size, must free, in, simple ref, */
/* 224 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 226 */	NdrFcShort( 0x3d6 ),	/* Type Offset=982 */

	/* Return value */

/* 228 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 230 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 232 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

			0x0
        }
    };

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/*  4 */	NdrFcLong( 0x20400 ),	/* 132096 */
/*  8 */	NdrFcShort( 0x0 ),	/* 0 */
/* 10 */	NdrFcShort( 0x0 ),	/* 0 */
/* 12 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 14 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 16 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 18 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 20 */	
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 22 */	NdrFcShort( 0x1c ),	/* Offset= 28 (50) */
/* 24 */	
			0x13, 0x0,	/* FC_OP */
/* 26 */	NdrFcShort( 0xe ),	/* Offset= 14 (40) */
/* 28 */	
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 30 */	NdrFcShort( 0x2 ),	/* 2 */
/* 32 */	0x9,		/* Corr desc: FC_ULONG */
			0x0,		/*  */
/* 34 */	NdrFcShort( 0xfffc ),	/* -4 */
/* 36 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 38 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 40 */	
			0x17,		/* FC_CSTRUCT */
			0x3,		/* 3 */
/* 42 */	NdrFcShort( 0x8 ),	/* 8 */
/* 44 */	NdrFcShort( 0xfffffff0 ),	/* Offset= -16 (28) */
/* 46 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 48 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 50 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 52 */	NdrFcShort( 0x0 ),	/* 0 */
/* 54 */	NdrFcShort( 0x8 ),	/* 8 */
/* 56 */	NdrFcShort( 0x0 ),	/* 0 */
/* 58 */	NdrFcShort( 0xffffffde ),	/* Offset= -34 (24) */
/* 60 */	
			0x12, 0x0,	/* FC_UP */
/* 62 */	NdrFcShort( 0xffffffea ),	/* Offset= -22 (40) */
/* 64 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 66 */	NdrFcShort( 0x0 ),	/* 0 */
/* 68 */	NdrFcShort( 0x8 ),	/* 8 */
/* 70 */	NdrFcShort( 0x0 ),	/* 0 */
/* 72 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (60) */
/* 74 */	
			0x11, 0x0,	/* FC_RP */
/* 76 */	NdrFcShort( 0x38a ),	/* Offset= 906 (982) */
/* 78 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 80 */	NdrFcShort( 0x2 ),	/* Offset= 2 (82) */
/* 82 */	
			0x12, 0x0,	/* FC_UP */
/* 84 */	NdrFcShort( 0x370 ),	/* Offset= 880 (964) */
/* 86 */	
			0x2a,		/* FC_ENCAPSULATED_UNION */
			0x89,		/* 137 */
/* 88 */	NdrFcShort( 0x20 ),	/* 32 */
/* 90 */	NdrFcShort( 0xa ),	/* 10 */
/* 92 */	NdrFcLong( 0x8 ),	/* 8 */
/* 96 */	NdrFcShort( 0x50 ),	/* Offset= 80 (176) */
/* 98 */	NdrFcLong( 0xd ),	/* 13 */
/* 102 */	NdrFcShort( 0x82 ),	/* Offset= 130 (232) */
/* 104 */	NdrFcLong( 0x9 ),	/* 9 */
/* 108 */	NdrFcShort( 0xa2 ),	/* Offset= 162 (270) */
/* 110 */	NdrFcLong( 0xc ),	/* 12 */
/* 114 */	NdrFcShort( 0x26e ),	/* Offset= 622 (736) */
/* 116 */	NdrFcLong( 0x24 ),	/* 36 */
/* 120 */	NdrFcShort( 0x28e ),	/* Offset= 654 (774) */
/* 122 */	NdrFcLong( 0x800d ),	/* 32781 */
/* 126 */	NdrFcShort( 0x2aa ),	/* Offset= 682 (808) */
/* 128 */	NdrFcLong( 0x10 ),	/* 16 */
/* 132 */	NdrFcShort( 0x2c4 ),	/* Offset= 708 (840) */
/* 134 */	NdrFcLong( 0x2 ),	/* 2 */
/* 138 */	NdrFcShort( 0x2da ),	/* Offset= 730 (868) */
/* 140 */	NdrFcLong( 0x3 ),	/* 3 */
/* 144 */	NdrFcShort( 0x2f0 ),	/* Offset= 752 (896) */
/* 146 */	NdrFcLong( 0x14 ),	/* 20 */
/* 150 */	NdrFcShort( 0x306 ),	/* Offset= 774 (924) */
/* 152 */	NdrFcShort( 0xffffffff ),	/* Offset= -1 (151) */
/* 154 */	
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 156 */	NdrFcShort( 0x0 ),	/* 0 */
/* 158 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 160 */	NdrFcShort( 0x0 ),	/* 0 */
/* 162 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 164 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 168 */	NdrFcShort( 0x0 ),	/* Corr flags:  */
/* 170 */	
			0x12, 0x0,	/* FC_UP */
/* 172 */	NdrFcShort( 0xffffff7c ),	/* Offset= -132 (40) */
/* 174 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 176 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 178 */	NdrFcShort( 0x10 ),	/* 16 */
/* 180 */	NdrFcShort( 0x0 ),	/* 0 */
/* 182 */	NdrFcShort( 0x6 ),	/* Offset= 6 (188) */
/* 184 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 186 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 188 */	
			0x11, 0x0,	/* FC_RP */
/* 190 */	NdrFcShort( 0xffffffdc ),	/* Offset= -36 (154) */
/* 192 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 194 */	NdrFcLong( 0x0 ),	/* 0 */
/* 198 */	NdrFcShort( 0x0 ),	/* 0 */
/* 200 */	NdrFcShort( 0x0 ),	/* 0 */
/* 202 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 204 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 206 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 208 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 210 */	
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 212 */	NdrFcShort( 0x0 ),	/* 0 */
/* 214 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 216 */	NdrFcShort( 0x0 ),	/* 0 */
/* 218 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 220 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 224 */	NdrFcShort( 0x0 ),	/* Corr flags:  */
/* 226 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 228 */	NdrFcShort( 0xffffffdc ),	/* Offset= -36 (192) */
/* 230 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 232 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 234 */	NdrFcShort( 0x10 ),	/* 16 */
/* 236 */	NdrFcShort( 0x0 ),	/* 0 */
/* 238 */	NdrFcShort( 0x6 ),	/* Offset= 6 (244) */
/* 240 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 242 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 244 */	
			0x11, 0x0,	/* FC_RP */
/* 246 */	NdrFcShort( 0xffffffdc ),	/* Offset= -36 (210) */
/* 248 */	
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 250 */	NdrFcShort( 0x0 ),	/* 0 */
/* 252 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 254 */	NdrFcShort( 0x0 ),	/* 0 */
/* 256 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 258 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 262 */	NdrFcShort( 0x0 ),	/* Corr flags:  */
/* 264 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 266 */	NdrFcShort( 0xfffffef8 ),	/* Offset= -264 (2) */
/* 268 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 270 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 272 */	NdrFcShort( 0x10 ),	/* 16 */
/* 274 */	NdrFcShort( 0x0 ),	/* 0 */
/* 276 */	NdrFcShort( 0x6 ),	/* Offset= 6 (282) */
/* 278 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 280 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 282 */	
			0x11, 0x0,	/* FC_RP */
/* 284 */	NdrFcShort( 0xffffffdc ),	/* Offset= -36 (248) */
/* 286 */	
			0x2b,		/* FC_NON_ENCAPSULATED_UNION */
			0x9,		/* FC_ULONG */
/* 288 */	0x7,		/* Corr desc: FC_USHORT */
			0x0,		/*  */
/* 290 */	NdrFcShort( 0xfff8 ),	/* -8 */
/* 292 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 294 */	NdrFcShort( 0x2 ),	/* Offset= 2 (296) */
/* 296 */	NdrFcShort( 0x10 ),	/* 16 */
/* 298 */	NdrFcShort( 0x2b ),	/* 43 */
/* 300 */	NdrFcLong( 0x3 ),	/* 3 */
/* 304 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 306 */	NdrFcLong( 0x11 ),	/* 17 */
/* 310 */	NdrFcShort( 0x8002 ),	/* Simple arm type: FC_CHAR */
/* 312 */	NdrFcLong( 0x2 ),	/* 2 */
/* 316 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 318 */	NdrFcLong( 0x4 ),	/* 4 */
/* 322 */	NdrFcShort( 0x800a ),	/* Simple arm type: FC_FLOAT */
/* 324 */	NdrFcLong( 0x5 ),	/* 5 */
/* 328 */	NdrFcShort( 0x800c ),	/* Simple arm type: FC_DOUBLE */
/* 330 */	NdrFcLong( 0xb ),	/* 11 */
/* 334 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 336 */	NdrFcLong( 0xa ),	/* 10 */
/* 340 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 342 */	NdrFcLong( 0x6 ),	/* 6 */
/* 346 */	NdrFcShort( 0xd6 ),	/* Offset= 214 (560) */
/* 348 */	NdrFcLong( 0x7 ),	/* 7 */
/* 352 */	NdrFcShort( 0x800c ),	/* Simple arm type: FC_DOUBLE */
/* 354 */	NdrFcLong( 0x8 ),	/* 8 */
/* 358 */	NdrFcShort( 0xfffffed6 ),	/* Offset= -298 (60) */
/* 360 */	NdrFcLong( 0xd ),	/* 13 */
/* 364 */	NdrFcShort( 0xffffff54 ),	/* Offset= -172 (192) */
/* 366 */	NdrFcLong( 0x9 ),	/* 9 */
/* 370 */	NdrFcShort( 0xfffffe90 ),	/* Offset= -368 (2) */
/* 372 */	NdrFcLong( 0x2000 ),	/* 8192 */
/* 376 */	NdrFcShort( 0xbe ),	/* Offset= 190 (566) */
/* 378 */	NdrFcLong( 0x24 ),	/* 36 */
/* 382 */	NdrFcShort( 0xbc ),	/* Offset= 188 (570) */
/* 384 */	NdrFcLong( 0x4024 ),	/* 16420 */
/* 388 */	NdrFcShort( 0xb6 ),	/* Offset= 182 (570) */
/* 390 */	NdrFcLong( 0x4011 ),	/* 16401 */
/* 394 */	NdrFcShort( 0xe8 ),	/* Offset= 232 (626) */
/* 396 */	NdrFcLong( 0x4002 ),	/* 16386 */
/* 400 */	NdrFcShort( 0xe6 ),	/* Offset= 230 (630) */
/* 402 */	NdrFcLong( 0x4003 ),	/* 16387 */
/* 406 */	NdrFcShort( 0xe4 ),	/* Offset= 228 (634) */
/* 408 */	NdrFcLong( 0x4004 ),	/* 16388 */
/* 412 */	NdrFcShort( 0xe2 ),	/* Offset= 226 (638) */
/* 414 */	NdrFcLong( 0x4005 ),	/* 16389 */
/* 418 */	NdrFcShort( 0xe0 ),	/* Offset= 224 (642) */
/* 420 */	NdrFcLong( 0x400b ),	/* 16395 */
/* 424 */	NdrFcShort( 0xce ),	/* Offset= 206 (630) */
/* 426 */	NdrFcLong( 0x400a ),	/* 16394 */
/* 430 */	NdrFcShort( 0xcc ),	/* Offset= 204 (634) */
/* 432 */	NdrFcLong( 0x4006 ),	/* 16390 */
/* 436 */	NdrFcShort( 0xd2 ),	/* Offset= 210 (646) */
/* 438 */	NdrFcLong( 0x4007 ),	/* 16391 */
/* 442 */	NdrFcShort( 0xc8 ),	/* Offset= 200 (642) */
/* 444 */	NdrFcLong( 0x4008 ),	/* 16392 */
/* 448 */	NdrFcShort( 0xca ),	/* Offset= 202 (650) */
/* 450 */	NdrFcLong( 0x400d ),	/* 16397 */
/* 454 */	NdrFcShort( 0xc8 ),	/* Offset= 200 (654) */
/* 456 */	NdrFcLong( 0x4009 ),	/* 16393 */
/* 460 */	NdrFcShort( 0xc6 ),	/* Offset= 198 (658) */
/* 462 */	NdrFcLong( 0x6000 ),	/* 24576 */
/* 466 */	NdrFcShort( 0xc4 ),	/* Offset= 196 (662) */
/* 468 */	NdrFcLong( 0x400c ),	/* 16396 */
/* 472 */	NdrFcShort( 0xc6 ),	/* Offset= 198 (670) */
/* 474 */	NdrFcLong( 0x10 ),	/* 16 */
/* 478 */	NdrFcShort( 0x8002 ),	/* Simple arm type: FC_CHAR */
/* 480 */	NdrFcLong( 0x12 ),	/* 18 */
/* 484 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 486 */	NdrFcLong( 0x13 ),	/* 19 */
/* 490 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 492 */	NdrFcLong( 0x16 ),	/* 22 */
/* 496 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 498 */	NdrFcLong( 0x17 ),	/* 23 */
/* 502 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 504 */	NdrFcLong( 0xe ),	/* 14 */
/* 508 */	NdrFcShort( 0xaa ),	/* Offset= 170 (678) */
/* 510 */	NdrFcLong( 0x400e ),	/* 16398 */
/* 514 */	NdrFcShort( 0xb0 ),	/* Offset= 176 (690) */
/* 516 */	NdrFcLong( 0x4010 ),	/* 16400 */
/* 520 */	NdrFcShort( 0x6a ),	/* Offset= 106 (626) */
/* 522 */	NdrFcLong( 0x4012 ),	/* 16402 */
/* 526 */	NdrFcShort( 0x68 ),	/* Offset= 104 (630) */
/* 528 */	NdrFcLong( 0x4013 ),	/* 16403 */
/* 532 */	NdrFcShort( 0x66 ),	/* Offset= 102 (634) */
/* 534 */	NdrFcLong( 0x4016 ),	/* 16406 */
/* 538 */	NdrFcShort( 0x60 ),	/* Offset= 96 (634) */
/* 540 */	NdrFcLong( 0x4017 ),	/* 16407 */
/* 544 */	NdrFcShort( 0x5a ),	/* Offset= 90 (634) */
/* 546 */	NdrFcLong( 0x0 ),	/* 0 */
/* 550 */	NdrFcShort( 0x0 ),	/* Offset= 0 (550) */
/* 552 */	NdrFcLong( 0x1 ),	/* 1 */
/* 556 */	NdrFcShort( 0x0 ),	/* Offset= 0 (556) */
/* 558 */	NdrFcShort( 0xffffffff ),	/* Offset= -1 (557) */
/* 560 */	
			0x15,		/* FC_STRUCT */
			0x7,		/* 7 */
/* 562 */	NdrFcShort( 0x8 ),	/* 8 */
/* 564 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 566 */	
			0x12, 0x0,	/* FC_UP */
/* 568 */	NdrFcShort( 0x18c ),	/* Offset= 396 (964) */
/* 570 */	
			0x12, 0x0,	/* FC_UP */
/* 572 */	NdrFcShort( 0x20 ),	/* Offset= 32 (604) */
/* 574 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 576 */	NdrFcLong( 0x2f ),	/* 47 */
/* 580 */	NdrFcShort( 0x0 ),	/* 0 */
/* 582 */	NdrFcShort( 0x0 ),	/* 0 */
/* 584 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 586 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 588 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 590 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 592 */	
			0x1b,		/* FC_CARRAY */
			0x0,		/* 0 */
/* 594 */	NdrFcShort( 0x1 ),	/* 1 */
/* 596 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 598 */	NdrFcShort( 0x4 ),	/* 4 */
/* 600 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 602 */	0x1,		/* FC_BYTE */
			0x5b,		/* FC_END */
/* 604 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 606 */	NdrFcShort( 0x18 ),	/* 24 */
/* 608 */	NdrFcShort( 0x0 ),	/* 0 */
/* 610 */	NdrFcShort( 0xc ),	/* Offset= 12 (622) */
/* 612 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 614 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 616 */	NdrFcShort( 0xffffffd6 ),	/* Offset= -42 (574) */
/* 618 */	0x39,		/* FC_ALIGNM8 */
			0x36,		/* FC_POINTER */
/* 620 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 622 */	
			0x12, 0x0,	/* FC_UP */
/* 624 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (592) */
/* 626 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 628 */	0x2,		/* FC_CHAR */
			0x5c,		/* FC_PAD */
/* 630 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 632 */	0x6,		/* FC_SHORT */
			0x5c,		/* FC_PAD */
/* 634 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 636 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */
/* 638 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 640 */	0xa,		/* FC_FLOAT */
			0x5c,		/* FC_PAD */
/* 642 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 644 */	0xc,		/* FC_DOUBLE */
			0x5c,		/* FC_PAD */
/* 646 */	
			0x12, 0x0,	/* FC_UP */
/* 648 */	NdrFcShort( 0xffffffa8 ),	/* Offset= -88 (560) */
/* 650 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 652 */	NdrFcShort( 0xfffffdb0 ),	/* Offset= -592 (60) */
/* 654 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 656 */	NdrFcShort( 0xfffffe30 ),	/* Offset= -464 (192) */
/* 658 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 660 */	NdrFcShort( 0xfffffd6e ),	/* Offset= -658 (2) */
/* 662 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 664 */	NdrFcShort( 0x2 ),	/* Offset= 2 (666) */
/* 666 */	
			0x12, 0x0,	/* FC_UP */
/* 668 */	NdrFcShort( 0x128 ),	/* Offset= 296 (964) */
/* 670 */	
			0x12, 0x10,	/* FC_UP [pointer_deref] */
/* 672 */	NdrFcShort( 0x2 ),	/* Offset= 2 (674) */
/* 674 */	
			0x12, 0x0,	/* FC_UP */
/* 676 */	NdrFcShort( 0x12 ),	/* Offset= 18 (694) */
/* 678 */	
			0x15,		/* FC_STRUCT */
			0x7,		/* 7 */
/* 680 */	NdrFcShort( 0x10 ),	/* 16 */
/* 682 */	0x6,		/* FC_SHORT */
			0x2,		/* FC_CHAR */
/* 684 */	0x2,		/* FC_CHAR */
			0x38,		/* FC_ALIGNM4 */
/* 686 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 688 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 690 */	
			0x12, 0x0,	/* FC_UP */
/* 692 */	NdrFcShort( 0xfffffff2 ),	/* Offset= -14 (678) */
/* 694 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x7,		/* 7 */
/* 696 */	NdrFcShort( 0x20 ),	/* 32 */
/* 698 */	NdrFcShort( 0x0 ),	/* 0 */
/* 700 */	NdrFcShort( 0x0 ),	/* Offset= 0 (700) */
/* 702 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 704 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 706 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 708 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 710 */	NdrFcShort( 0xfffffe58 ),	/* Offset= -424 (286) */
/* 712 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 714 */	
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 716 */	NdrFcShort( 0x0 ),	/* 0 */
/* 718 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 720 */	NdrFcShort( 0x0 ),	/* 0 */
/* 722 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 724 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 728 */	NdrFcShort( 0x0 ),	/* Corr flags:  */
/* 730 */	
			0x12, 0x0,	/* FC_UP */
/* 732 */	NdrFcShort( 0xffffffda ),	/* Offset= -38 (694) */
/* 734 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 736 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 738 */	NdrFcShort( 0x10 ),	/* 16 */
/* 740 */	NdrFcShort( 0x0 ),	/* 0 */
/* 742 */	NdrFcShort( 0x6 ),	/* Offset= 6 (748) */
/* 744 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 746 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 748 */	
			0x11, 0x0,	/* FC_RP */
/* 750 */	NdrFcShort( 0xffffffdc ),	/* Offset= -36 (714) */
/* 752 */	
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 754 */	NdrFcShort( 0x0 ),	/* 0 */
/* 756 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 758 */	NdrFcShort( 0x0 ),	/* 0 */
/* 760 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 762 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 766 */	NdrFcShort( 0x0 ),	/* Corr flags:  */
/* 768 */	
			0x12, 0x0,	/* FC_UP */
/* 770 */	NdrFcShort( 0xffffff5a ),	/* Offset= -166 (604) */
/* 772 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 774 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 776 */	NdrFcShort( 0x10 ),	/* 16 */
/* 778 */	NdrFcShort( 0x0 ),	/* 0 */
/* 780 */	NdrFcShort( 0x6 ),	/* Offset= 6 (786) */
/* 782 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 784 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 786 */	
			0x11, 0x0,	/* FC_RP */
/* 788 */	NdrFcShort( 0xffffffdc ),	/* Offset= -36 (752) */
/* 790 */	
			0x1d,		/* FC_SMFARRAY */
			0x0,		/* 0 */
/* 792 */	NdrFcShort( 0x8 ),	/* 8 */
/* 794 */	0x2,		/* FC_CHAR */
			0x5b,		/* FC_END */
/* 796 */	
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 798 */	NdrFcShort( 0x10 ),	/* 16 */
/* 800 */	0x8,		/* FC_LONG */
			0x6,		/* FC_SHORT */
/* 802 */	0x6,		/* FC_SHORT */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 804 */	0x0,		/* 0 */
			NdrFcShort( 0xfffffff1 ),	/* Offset= -15 (790) */
			0x5b,		/* FC_END */
/* 808 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 810 */	NdrFcShort( 0x20 ),	/* 32 */
/* 812 */	NdrFcShort( 0x0 ),	/* 0 */
/* 814 */	NdrFcShort( 0xa ),	/* Offset= 10 (824) */
/* 816 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 818 */	0x36,		/* FC_POINTER */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 820 */	0x0,		/* 0 */
			NdrFcShort( 0xffffffe7 ),	/* Offset= -25 (796) */
			0x5b,		/* FC_END */
/* 824 */	
			0x11, 0x0,	/* FC_RP */
/* 826 */	NdrFcShort( 0xfffffd98 ),	/* Offset= -616 (210) */
/* 828 */	
			0x1b,		/* FC_CARRAY */
			0x0,		/* 0 */
/* 830 */	NdrFcShort( 0x1 ),	/* 1 */
/* 832 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 834 */	NdrFcShort( 0x0 ),	/* 0 */
/* 836 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 838 */	0x1,		/* FC_BYTE */
			0x5b,		/* FC_END */
/* 840 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 842 */	NdrFcShort( 0x10 ),	/* 16 */
/* 844 */	NdrFcShort( 0x0 ),	/* 0 */
/* 846 */	NdrFcShort( 0x6 ),	/* Offset= 6 (852) */
/* 848 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 850 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 852 */	
			0x12, 0x0,	/* FC_UP */
/* 854 */	NdrFcShort( 0xffffffe6 ),	/* Offset= -26 (828) */
/* 856 */	
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 858 */	NdrFcShort( 0x2 ),	/* 2 */
/* 860 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 862 */	NdrFcShort( 0x0 ),	/* 0 */
/* 864 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 866 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 868 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 870 */	NdrFcShort( 0x10 ),	/* 16 */
/* 872 */	NdrFcShort( 0x0 ),	/* 0 */
/* 874 */	NdrFcShort( 0x6 ),	/* Offset= 6 (880) */
/* 876 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 878 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 880 */	
			0x12, 0x0,	/* FC_UP */
/* 882 */	NdrFcShort( 0xffffffe6 ),	/* Offset= -26 (856) */
/* 884 */	
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 886 */	NdrFcShort( 0x4 ),	/* 4 */
/* 888 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 890 */	NdrFcShort( 0x0 ),	/* 0 */
/* 892 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 894 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 896 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 898 */	NdrFcShort( 0x10 ),	/* 16 */
/* 900 */	NdrFcShort( 0x0 ),	/* 0 */
/* 902 */	NdrFcShort( 0x6 ),	/* Offset= 6 (908) */
/* 904 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 906 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 908 */	
			0x12, 0x0,	/* FC_UP */
/* 910 */	NdrFcShort( 0xffffffe6 ),	/* Offset= -26 (884) */
/* 912 */	
			0x1b,		/* FC_CARRAY */
			0x7,		/* 7 */
/* 914 */	NdrFcShort( 0x8 ),	/* 8 */
/* 916 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 918 */	NdrFcShort( 0x0 ),	/* 0 */
/* 920 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 922 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 924 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 926 */	NdrFcShort( 0x10 ),	/* 16 */
/* 928 */	NdrFcShort( 0x0 ),	/* 0 */
/* 930 */	NdrFcShort( 0x6 ),	/* Offset= 6 (936) */
/* 932 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 934 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 936 */	
			0x12, 0x0,	/* FC_UP */
/* 938 */	NdrFcShort( 0xffffffe6 ),	/* Offset= -26 (912) */
/* 940 */	
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 942 */	NdrFcShort( 0x8 ),	/* 8 */
/* 944 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 946 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 948 */	
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 950 */	NdrFcShort( 0x8 ),	/* 8 */
/* 952 */	0x7,		/* Corr desc: FC_USHORT */
			0x0,		/*  */
/* 954 */	NdrFcShort( 0xffc8 ),	/* -56 */
/* 956 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 958 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 960 */	NdrFcShort( 0xffffffec ),	/* Offset= -20 (940) */
/* 962 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 964 */	
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 966 */	NdrFcShort( 0x38 ),	/* 56 */
/* 968 */	NdrFcShort( 0xffffffec ),	/* Offset= -20 (948) */
/* 970 */	NdrFcShort( 0x0 ),	/* Offset= 0 (970) */
/* 972 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 974 */	0x38,		/* FC_ALIGNM4 */
			0x8,		/* FC_LONG */
/* 976 */	0x8,		/* FC_LONG */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 978 */	0x4,		/* 4 */
			NdrFcShort( 0xfffffc83 ),	/* Offset= -893 (86) */
			0x5b,		/* FC_END */
/* 982 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 984 */	NdrFcShort( 0x1 ),	/* 1 */
/* 986 */	NdrFcShort( 0x8 ),	/* 8 */
/* 988 */	NdrFcShort( 0x0 ),	/* 0 */
/* 990 */	NdrFcShort( 0xfffffc70 ),	/* Offset= -912 (78) */

			0x0
        }
    };

const CInterfaceProxyVtbl * _sample_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_IMessengerProxyVtbl,
    ( CInterfaceProxyVtbl *) &_IListenerProxyVtbl,
    0
};

const CInterfaceStubVtbl * _sample_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_IMessengerStubVtbl,
    ( CInterfaceStubVtbl *) &_IListenerStubVtbl,
    0
};

PCInterfaceName const _sample_InterfaceNamesList[] = 
{
    "IMessenger",
    "IListener",
    0
};


#define _sample_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _sample, pIID, n)

int __stdcall _sample_IID_Lookup( const IID * pIID, int * pIndex )
{
    IID_BS_LOOKUP_SETUP

    IID_BS_LOOKUP_INITIAL_TEST( _sample, 2, 1 )
    IID_BS_LOOKUP_RETURN_RESULT( _sample, 2, *pIndex )
    
}

const ExtendedProxyFileInfo sample_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _sample_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _sample_StubVtblList,
    (const PCInterfaceName * ) & _sample_InterfaceNamesList,
    0, // no delegation
    & _sample_IID_Lookup, 
    2,
    2,
    0, /* table of [async_uuid] interfaces */
    0, /* Filler1 */
    0, /* Filler2 */
    0  /* Filler3 */
};


#endif /* defined(_M_IA64) || defined(_M_AXP64)*/

