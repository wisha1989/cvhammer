// **********************************************************************
//
// Copyright (c) 2003-2013 ZeroC, Inc. All rights reserved.
//
// This copy of Ice is licensed to you under the terms described in the
// ICE_LICENSE file included in this distribution.
//
// **********************************************************************
//
// Ice version 3.5.0
//
// <auto-generated>
//
// Generated from file `img_proc_server.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

package imgprocserver;

public interface ImgProcServerInterfacePrx extends Ice.ObjectPrx
{
    public java.util.Map<java.lang.String, java.lang.String> doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params);

    public java.util.Map<java.lang.String, java.lang.String> doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx);

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params);

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx);

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, Ice.Callback __cb);

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx, Ice.Callback __cb);

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, Callback_ImgProcServerInterface_doProcess __cb);

    public Ice.AsyncResult begin_doProcess(byte[] img, java.util.Map<java.lang.String, java.lang.String> params, java.util.Map<String, String> __ctx, Callback_ImgProcServerInterface_doProcess __cb);

    public java.util.Map<java.lang.String, java.lang.String> end_doProcess(Ice.AsyncResult __result);
}
