package imgprocserver;

import java.util.Map;

public class SingletonImgProcessor {

	private SingletonImgProcessor() {

	}

	private static void init() {
		Ice.Communicator ic = null;
		ic = Ice.Util.initialize();
		Ice.ObjectPrx base = ic
				.stringToProxy("ImgProcServerInterface:default -h 121.42.179.29 -p 10000");
		processor = ImgProcServerInterfacePrxHelper.checkedCast(base);
	}

	private static void sketch_init() {
		Ice.Communicator ic = null;
		ic = Ice.Util.initialize();
		Ice.ObjectPrx base = ic
				.stringToProxy("ImgProcServerInterface:default -h 121.42.179.29 -p 10002");
		sketch_processor = ImgProcServerInterfacePrxHelper.checkedCast(base);
	}

	// lulufong 2016/2/26 add sketch_retrieve_int()
	private static void sketch_retrieve_int() {
		Ice.Communicator ic = null;
		ic = Ice.Util.initialize();
		Ice.ObjectPrx base = ic
				.stringToProxy("ImgProcServerInterface:default -h 121.42.179.29 -p 10003");
		sketch_retrieve_processor = ImgProcServerInterfacePrxHelper
				.checkedCast(base);
	}

	public synchronized static Map<String, String> process(byte[] imgFile,
			Map<String, String> params) {

		if (processor == null) {
			init();
		}

		Map<String, String> re = null;
		try {
			re = processor.doProcess(imgFile, params);
		} catch (Exception e) {
			init();
		}
		return re;

	}

	public synchronized static Map<String, String> sketch_process(
			byte[] imgFile, Map<String, String> params) {

		if (sketch_processor == null) {
			sketch_init();
		}

		Map<String, String> re = null;
		try {
			re = sketch_processor.doProcess(imgFile, params);
		} catch (Exception e) {
			sketch_init();

		}

		return re;

	}

	// lulufong 2016/2/26 add sketch_retrive_process()
	public synchronized static Map<String, String> sketch_retrieve_process(byte[] imgFile,
			Map<String, String> params) {

		if (sketch_retrieve_processor == null) {
			sketch_retrieve_int();
		}
		synchronized (sketch_retrieve_processor) {
			Map<String, String> re = null;
			try {
				re = sketch_retrieve_processor.doProcess(imgFile, params);
			} catch (Exception e) {
				sketch_init();

			}

			return re;
		}
	}

	private static ImgProcServerInterfacePrx processor = null;
	private static ImgProcServerInterfacePrx sketch_processor = null;
	private static ImgProcServerInterfacePrx sketch_retrieve_processor = null;

}
