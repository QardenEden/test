package org.test.test;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class OrderUtils {

	private OrderUtils() {

	}

	/**
	 * 
	 * ��map���� �� ����value��������
	 * 
	 * @param <K>
	 *            key����
	 * @param <V>
	 *            value ���� �� ����̳�Comparable
	 * @param map
	 *            �������map
	 * @param desc
	 *            ���� true ����false
	 * @return List<Map.Entry<K, V>> ������list
	 */
	public static <K, V extends Comparable<? super V>> List<Map.Entry<K, V>> orderMapByValue(Map<K, V> map,
			final boolean desc) {
		List<Map.Entry<K, V>> list = new ArrayList<Map.Entry<K, V>>(map.entrySet());
		Collections.sort(list, new Comparator<Map.Entry<K, V>>() {
			public int compare(Entry<K, V> o1, Entry<K, V> o2) {
				if (desc) { // ����
					if (o1.getValue() == null && o2.getValue() == null) {
						return 0;
					} else if (o2.getValue() == null) {
						return -1;
					} else if (o1.getValue() == null) {
						return 1;
					} else {
						System.out.println(o1 + " compareTo " + o2 + " " + o2.getValue().compareTo(o1.getValue()));
						return o2.getValue().compareTo(o1.getValue());
					}
				} else { // ����
					if (o1.getValue() == null && o2.getValue() == null) {
						return 0;
					} else if (o2.getValue() == null) {
						return 1;
					} else if (o1.getValue() == null) {
						return -1;
					} else {
						return o1.getValue().compareTo(o2.getValue());
					}
				}
			}
		});
		return list;
	}

	/**
	 * 
	 * ��map���� �� ����key��������
	 * 
	 * @param <K>
	 *            key���ͣ� ����̳�Comparable
	 * @param <V>
	 *            value ����
	 * @param map
	 *            �������map
	 * @param desc
	 *            ���� true ����false
	 * @return List<Map.Entry<K, V>> ������list
	 */
	public static <K extends Comparable<? super K>, V> List<Map.Entry<K, V>> orderMapByKey(Map<K, V> map,
			final boolean desc) {
		List<Map.Entry<K, V>> list = new ArrayList<Map.Entry<K, V>>(map.entrySet());
		Collections.sort(list, new Comparator<Map.Entry<K, V>>() {
			public int compare(Entry<K, V> o1, Entry<K, V> o2) {
				if (desc) { // ����
					if (o1.getKey() == null && o2.getKey() == null) {
						return 0;
					} else if (o2.getKey() == null) {
						return -1;
					} else if (o1.getKey() == null) {
						return 1;
					} else {
						return o2.getKey().compareTo(o1.getKey());
					}
				} else { // ����
					if (o1.getKey() == null && o2.getKey() == null) {
						return 0;
					} else if (o2.getKey() == null) {
						return 1;
					} else if (o1.getKey() == null) {
						return -1;
					} else {
						return o1.getKey().compareTo(o2.getKey());
					}
				}
			}
		});
		return list;
	}

	/**
	 * ��һ��list��������
	 * 
	 * 
	 * @param <E>
	 *            list�е�Ԫ�ر���̳�Comparable
	 * @param list
	 *            ������list
	 * @param desc
	 *            �Ƿ�������
	 */
	public static <E extends Comparable<? super E>> void sortList(List<E> list, final boolean desc) {
		if (list != null) {
			Collections.sort(list, new Comparator<E>() {
				public int compare(E o1, E o2) {
					if (desc) { // ����
						if (o1 == null && o2 == null) {
							return 0;
						} else if (o2 == null) {
							return -1;
						} else if (o1 == null) {
							return 1;
						} else {
							return o2.compareTo(o1);
						}
					} else { // ����
						if (o1 == null && o2 == null) {
							return 0;
						} else if (o2 == null) {
							return 1;
						} else if (o1 == null) {
							return -1;
						} else {
							return o1.compareTo(o2);
						}
					}
				}
			});
		}

	}

	/**
	 * ��һ��set���ͽ������� �� ���Ϊ�� �� ������ �� ������� �� ���������ݽ�������
	 * 
	 * @param <E>
	 *            �̳бȽ�Comparable
	 * @param set
	 *            set����
	 * @param desc
	 *            �Ƿ�������
	 * @return �������list �� ���set == null �� ����һ���յ�list �� ���� �� ����һ������desc��ֵ����list
	 */
	public static <E extends Comparable<? super E>> List<E> sortSet(Collection<E> set, boolean desc) {
		List<E> list = new ArrayList<E>();
		if (set != null) {
			list.addAll(set);
			sortList(list, desc);
		}
		return list;
	}

	public static void main(String args[]) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		/**
		 * 
		 */
		System.out.println("2".compareTo("165"));
		map.put("1", 2);
		map.put("2", 1);
		map.put("3", null);
		map.put("4", 65);
		System.out.println(orderMapByKey(map, true));
	}

}
