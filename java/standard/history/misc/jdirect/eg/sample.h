
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


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


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __sample_h__
#define __sample_h__

/* Forward Declarations */ 

#ifndef __IMessenger_FWD_DEFINED__
#define __IMessenger_FWD_DEFINED__
typedef interface IMessenger IMessenger;
#endif 	/* __IMessenger_FWD_DEFINED__ */


#ifndef __IListener_FWD_DEFINED__
#define __IListener_FWD_DEFINED__
typedef interface IListener IListener;
#endif 	/* __IListener_FWD_DEFINED__ */


#ifndef __Hub2_FWD_DEFINED__
#define __Hub2_FWD_DEFINED__

#ifdef __cplusplus
typedef class Hub2 Hub2;
#else
typedef struct Hub2 Hub2;
#endif /* __cplusplus */

#endif 	/* __Hub2_FWD_DEFINED__ */


#ifndef __IListener_FWD_DEFINED__
#define __IListener_FWD_DEFINED__
typedef interface IListener IListener;
#endif 	/* __IListener_FWD_DEFINED__ */


/* header files for imported files */
#include "unknwn.h"
#include "oaidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __IMessenger_INTERFACE_DEFINED__
#define __IMessenger_INTERFACE_DEFINED__

/* interface IMessenger */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IMessenger;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0089E241-0AE1-11d2-9B9D-00C04F8C94D0")
    IMessenger : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE addListener( 
            /* [in] */ IDispatch __RPC_FAR *listener,
            /* [retval][out] */ BSTR __RPC_FAR *key) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE removeListener( 
            /* [in] */ BSTR key) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE sendMessage( 
            /* [in] */ BSTR message) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE sendObjects( 
            /* [in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *dataArray) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMessengerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IMessenger __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IMessenger __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IMessenger __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *addListener )( 
            IMessenger __RPC_FAR * This,
            /* [in] */ IDispatch __RPC_FAR *listener,
            /* [retval][out] */ BSTR __RPC_FAR *key);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *removeListener )( 
            IMessenger __RPC_FAR * This,
            /* [in] */ BSTR key);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *sendMessage )( 
            IMessenger __RPC_FAR * This,
            /* [in] */ BSTR message);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *sendObjects )( 
            IMessenger __RPC_FAR * This,
            /* [in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *dataArray);
        
        END_INTERFACE
    } IMessengerVtbl;

    interface IMessenger
    {
        CONST_VTBL struct IMessengerVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMessenger_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IMessenger_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IMessenger_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IMessenger_addListener(This,listener,key)	\
    (This)->lpVtbl -> addListener(This,listener,key)

#define IMessenger_removeListener(This,key)	\
    (This)->lpVtbl -> removeListener(This,key)

#define IMessenger_sendMessage(This,message)	\
    (This)->lpVtbl -> sendMessage(This,message)

#define IMessenger_sendObjects(This,dataArray)	\
    (This)->lpVtbl -> sendObjects(This,dataArray)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE IMessenger_addListener_Proxy( 
    IMessenger __RPC_FAR * This,
    /* [in] */ IDispatch __RPC_FAR *listener,
    /* [retval][out] */ BSTR __RPC_FAR *key);


void __RPC_STUB IMessenger_addListener_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IMessenger_removeListener_Proxy( 
    IMessenger __RPC_FAR * This,
    /* [in] */ BSTR key);


void __RPC_STUB IMessenger_removeListener_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IMessenger_sendMessage_Proxy( 
    IMessenger __RPC_FAR * This,
    /* [in] */ BSTR message);


void __RPC_STUB IMessenger_sendMessage_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IMessenger_sendObjects_Proxy( 
    IMessenger __RPC_FAR * This,
    /* [in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *dataArray);


void __RPC_STUB IMessenger_sendObjects_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IMessenger_INTERFACE_DEFINED__ */


#ifndef __IListener_INTERFACE_DEFINED__
#define __IListener_INTERFACE_DEFINED__

/* interface IListener */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IListener;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6266E5A0-0BA1-11d2-ADB3-00C04F8C9491")
    IListener : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE processMessage( 
            /* [in] */ BSTR message) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE processObjects( 
            /* [in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *dataArray) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IListenerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IListener __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IListener __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IListener __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *processMessage )( 
            IListener __RPC_FAR * This,
            /* [in] */ BSTR message);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *processObjects )( 
            IListener __RPC_FAR * This,
            /* [in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *dataArray);
        
        END_INTERFACE
    } IListenerVtbl;

    interface IListener
    {
        CONST_VTBL struct IListenerVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IListener_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IListener_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IListener_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IListener_processMessage(This,message)	\
    (This)->lpVtbl -> processMessage(This,message)

#define IListener_processObjects(This,dataArray)	\
    (This)->lpVtbl -> processObjects(This,dataArray)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE IListener_processMessage_Proxy( 
    IListener __RPC_FAR * This,
    /* [in] */ BSTR message);


void __RPC_STUB IListener_processMessage_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IListener_processObjects_Proxy( 
    IListener __RPC_FAR * This,
    /* [in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *dataArray);


void __RPC_STUB IListener_processObjects_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IListener_INTERFACE_DEFINED__ */



#ifndef __Hub2Lib_LIBRARY_DEFINED__
#define __Hub2Lib_LIBRARY_DEFINED__

/* library Hub2Lib */
/* [helpstring][version][uuid] */ 



EXTERN_C const IID LIBID_Hub2Lib;

EXTERN_C const CLSID CLSID_Hub2;

#ifdef __cplusplus

class DECLSPEC_UUID("04E5D4BA-0A64-11d2-9B9D-00C04F8C94D0")
Hub2;
#endif
#endif /* __Hub2Lib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * ); 

unsigned long             __RPC_USER  LPSAFEARRAY_UserSize(     unsigned long __RPC_FAR *, unsigned long            , LPSAFEARRAY __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  LPSAFEARRAY_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, LPSAFEARRAY __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  LPSAFEARRAY_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, LPSAFEARRAY __RPC_FAR * ); 
void                      __RPC_USER  LPSAFEARRAY_UserFree(     unsigned long __RPC_FAR *, LPSAFEARRAY __RPC_FAR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


